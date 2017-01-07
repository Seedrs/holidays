# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: definitions/ph.yaml
class PhDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_ph
{Date.civil(2015,4,3) => 'Good Friday',
 Date.civil(2015,4,9) => 'The Day of Valor',
 Date.civil(2015,5,1) => 'Labor Day',
 Date.civil(2015,6,12) => 'Independence Day',
 Date.civil(2015,8,21) => 'Ninoy Aquino Day',
 Date.civil(2015,8,31) => 'National Heroes Day',
 Date.civil(2015,11,30) => 'Bonifacio Day',
 Date.civil(2015,12,25) => 'Christmas Day',
 Date.civil(2015,12,30) => 'Rizal Day'}.each do |date, name|
  assert_equal name, (Holidays.on(date, :ph)[0] || {})[:name]
end

  end
end
