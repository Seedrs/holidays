require File.expand_path(File.dirname(__FILE__)) + '/test_helper'

require "#{Holidays::DEFINITIONS_PATH}/ca"

# Re-include CA defs via holidays/north_america to ensure that individual
# defs aren't duplicated.
require "#{Holidays::DEFINITIONS_PATH}/north_america"

class HolidaysTests < Test::Unit::TestCase
  def setup
    @date = Date.civil(2008,1,1)
  end

  def test_on
    h = Holidays.on(Date.civil(2008,9,1), :ca)
    assert_equal 'Labour Day', h[0][:name]

    holidays = Holidays.on(Date.civil(2008,7,4), :ca)
    assert_equal 0, holidays.length
  end

  def test_any_holidays_during_work_week
    ## Full weeks:
    # Try with a Monday
    assert Holidays.any_holidays_during_work_week?(Date.civil(2012,1,23), :us)
    # Try with a Wednesday
    assert Holidays.any_holidays_during_work_week?(Date.civil(2012,1,25), :us)
    # Try Sunday on a week going into a new month
    assert Holidays.any_holidays_during_work_week?(Date.civil(2012,1,29), :us)
    # Try Wednesday on a week going into a new month
    assert Holidays.any_holidays_during_work_week?(Date.civil(2012,2,1), :us)

    ## Weeks with holidays:
    # New Year's 2012 (on Sunday, observed Monday). Test from a Wednesday.
    assert_equal(false, Holidays.any_holidays_during_work_week?(Date.civil(2012,1,4), :us))
    # Ignore observed holidays with :no_observed
    assert Holidays.any_holidays_during_work_week?(Date.civil(2012,1,4), :us, :no_observed)
    # Labor Day 2012 should be Sept 3
    assert_equal(false, Holidays.any_holidays_during_work_week?(Date.civil(2012,9,5), :us))
    # Should be 10 non-full weeks in the year (in the US)
    weeks_in_2012 = Date.commercial(2013, -1).cweek
    holidays_in_2012 = weeks_in_2012.times.count { |week| Holidays.any_holidays_during_work_week?(Date.commercial(2012,week+1), :us) == false }
    assert_equal 10, holidays_in_2012
  end

  def test_requires_valid_regions
    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2008,1,1), :xx)
    end

    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2008,1,1), [:ca,:xx])
    end

    assert_raises Holidays::UnknownRegionError do
      Holidays.between(Date.civil(2008,1,1), Date.civil(2008,12,31), [:ca,:xx])
    end
  end

  def test_region_params
    holidays = Holidays.on(@date, :ca)
    assert_equal 1, holidays.length

    holidays = Holidays.on(@date, [:ca_bc,:ca])
    assert_equal 1, holidays.length
  end

  def test_observed_dates
    # Should fall on Tuesday the 1st
   assert_equal 1, Holidays.on(Date.civil(2008,7,1), :ca, :observed).length

    # Should fall on Monday the 2nd
    assert_equal 1, Holidays.on(Date.civil(2007,7,2), :ca, :observed).length
  end

  def test_any_region
    # Should return Victoria Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca)
    assert_equal 1, holidays.length

    # Should return Victoria Day and National Patriotes Day.
    #
    # Should be 2 in the CA region but other regional files are loaded during the
    # unit tests add to the :any count.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), [:any])
    assert holidays.length >= 2

    # Test blank region
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31))
    assert holidays.length >= 3
  end

  def test_sub_regions
    # Should return Victoria Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca)
    assert_equal 1, holidays.length

    # Should return Victoria Da and National Patriotes Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca_qc)
    assert_equal 2, holidays.length

    # Should return Victoria Day and National Patriotes Day.
    holidays = Holidays.between(Date.civil(2008,5,1), Date.civil(2008,5,31), :ca_)
    assert_equal 2, holidays.length
  end

  def test_easter_lambda
    [Date.civil(1800,4,11), Date.civil(1899,3,31), Date.civil(1900,4,13),
     Date.civil(2008,3,21), Date.civil(2035,3,23)].each do |date|
      assert_equal 'Good Friday', Holidays.on(date, :ca)[0][:name]
    end

    [Date.civil(1800,4,14), Date.civil(1899,4,3), Date.civil(1900,4,16),
     Date.civil(2008,3,24), Date.civil(2035,3,26)].each do |date|
      assert_equal 'Easter Monday', Holidays.on(date, :ca_qc, :informal)[0][:name]
    end
  end

  def test_sorting
    (1..10).each{|year|
      (1..12).each{|month|
        holidays = Holidays.between(Date.civil(year, month, 1), Date.civil(year, month, 28), :gb_)
        holidays.each_with_index{|holiday, index|
          assert holiday[:date] >= holidays[index - 1][:date] if index > 0
        }
      }
    }
  end

  #FIXME - I am not a huge fan of this test as it is written. It depends on the definitions not changing.
  #        I think that this is fine for an integration test but I think it should be labeled as such.
  def test_caching
    start_date = Date.civil(2008, 3, 21)
    end_date = Date.civil(2008, 3, 25)
    cache_data = Holidays.between(start_date, end_date, :ca, :informal)
    options = [:ca, :informal]

    Holidays::DefinitionFactory.cache_repository.expects(:cache_between).with(start_date, end_date, cache_data, options)

    Holidays.cache_between(Date.civil(2008,3,21), Date.civil(2008,3,25), :ca, :informal)

    # Test that cache has been set and it returns the same as before
    assert_equal 1, Holidays.on(Date.civil(2008, 3, 21), :ca, :informal).length
    assert_equal 1, Holidays.on(Date.civil(2008, 3, 24), :ca, :informal).length

    # Test that correct results are returned outside the cache range, and with no caching
    assert_equal 1, Holidays.on(Date.civil(2035,1,1), :ca, :informal).length
    assert_equal 1, Holidays.on(Date.civil(2035,1,1), :us).length
  end
end
