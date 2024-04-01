# require needed files
require './test/sets/owners'
require './test/sets/animals'
require './test/sets/pets'
require './test/sets/visits'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Owners
  include Contexts::Animals
  include Contexts::Pets
  include Contexts::Visits
  
  def create_all
    create_owners
    puts "Built owners and owner users"
    create_animals
    puts "Built animals"
    create_pets
    puts "Built pets"
    create_visits
    puts "Built visits"
  end
  
end