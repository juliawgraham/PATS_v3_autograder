# require needed files
require './test/sets/owners'
require './test/sets/animals'
require './test/sets/pets'
require './test/sets/visits'
require './test/sets/abilities'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Owners
  include Contexts::Animals
  include Contexts::Pets
  include Contexts::Visits
  include Contexts::Abilities
  
  def create_all
    create_owners
    puts "Built owners and owner users"
    create_animals
    puts "Built animals"
    create_pets
    puts "Built pets"
    create_visits
    puts "Built visits"
    create_abilities
    puts "Built abilities"
  end
  
end