# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: definitions/dk.yaml
  #
  # To use the definitions in this file, load it right after you load the
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'generated_definitions/dk'
  #
  # All the definitions are available at https://github.com/holidays/holidays
  module DK # :nodoc:
    def self.defined_regions
      [:dk]
    end

    def self.holidays_by_month
      {
              0 => [{:function => "easter(year)", :function_arguments => [:year], :function_modifier => -49, :type => :informal, :name => "Fastelavn", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => -7, :type => :informal, :name => "Palmesøndag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => -3, :name => "Skærtorsdag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => -2, :name => "Langfredag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :name => "Påskedag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 1, :name => "2. påskedag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 26, :name => "Store Bededag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 39, :name => "Kristi Himmelfartsdag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 49, :name => "Pinsedag", :regions => [:dk]},
            {:function => "easter(year)", :function_arguments => [:year], :function_modifier => 50, :name => "2. Pinsedag", :regions => [:dk]}],
      1 => [{:mday => 1, :name => "Nytårsdag", :regions => [:dk]}],
      4 => [{:mday => 1, :type => :informal, :name => "1. april", :regions => [:dk]},
            {:mday => 9, :type => :informal, :name => "Danmarks besættelse", :regions => [:dk]},
            {:mday => 16, :type => :informal, :name => "Dronningens fødselsdag", :regions => [:dk]}],
      5 => [{:mday => 1, :type => :informal, :name => "Arbejdernes kampdag", :regions => [:dk]},
            {:mday => 5, :type => :informal, :name => "Danmarks befrielse", :regions => [:dk]}],
      6 => [{:mday => 5, :type => :informal, :name => "Grundlovsdag", :regions => [:dk]},
            {:mday => 15, :type => :informal, :name => "Valdemarsdag og Genforeningsdag", :regions => [:dk]},
            {:mday => 23, :type => :informal, :name => "Sankt Hans aften", :regions => [:dk]}],
      11 => [{:mday => 10, :type => :informal, :name => "Mortensaften", :regions => [:dk]}],
      12 => [{:mday => 13, :type => :informal, :name => "Sankt Lucia", :regions => [:dk]},
            {:mday => 24, :type => :informal, :name => "Juleaftensdag", :regions => [:dk]},
            {:mday => 25, :name => "1. juledag", :regions => [:dk]},
            {:mday => 26, :name => "2. juledag", :regions => [:dk]}]
      }
    end

    def self.custom_methods
      {
        
      }
    end
  end
end
