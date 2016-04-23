# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: definitions/cz.yaml
  #
  # To use the definitions in this file, load it right after you load the
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'generated_definitions/cz'
  #
  # All the definitions are available at https://github.com/holidays/holidays
  module CZ # :nodoc:
    def self.defined_regions
      [:cz]
    end

    def self.holidays_by_month
      {
              0 => [{:function => "easter(year)", :function_arguments => [:year], :function_modifier => -2, :name => "Velký pátek", :regions => [:cz]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 1, :name => "Velikonoční pondělí", :regions => [:cz]}],
      1 => [{:mday => 1, :name => "Den obnovy samostatného českého státu", :regions => [:cz]}],
      5 => [{:mday => 1, :name => "Svátek práce", :regions => [:cz]},
            {:mday => 8, :name => "Den vítězství", :regions => [:cz]}],
      7 => [{:mday => 5, :name => "Den slovanských věrozvěstů Cyrila a Metoděje", :regions => [:cz]},
            {:mday => 6, :name => "Den upálení mistra Jana Husa", :regions => [:cz]}],
      9 => [{:mday => 28, :name => "Den české státnosti", :regions => [:cz]}],
      10 => [{:mday => 28, :name => "Den vzniku samostatného československého státu", :regions => [:cz]}],
      11 => [{:mday => 17, :name => "Den boje za svobodu a demokracii", :regions => [:cz]}],
      12 => [{:mday => 24, :name => "Štědrý den", :regions => [:cz]},
            {:mday => 25, :name => "1. svátek vánoční", :regions => [:cz]},
            {:mday => 26, :name => "2. svátek vánoční", :regions => [:cz]}]
      }
    end

    def self.custom_methods
      {
        
      }
    end
  end
end
