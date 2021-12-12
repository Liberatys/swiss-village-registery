require_relative "swiss_village_registery/version"
require "rutie"

module SwissVillageRegistery
  Rutie.new(:swiss_village_registery).init "Init_swiss_village_registery", __dir__
end
