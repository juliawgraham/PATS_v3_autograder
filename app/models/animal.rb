require 'helpers/Activeable'

class Animal < ApplicationRecord
  extend Activeable::ClassMethods

  # Relationships
  has_many :pets
  
  # Scopes
  scope :alphabetical, -> { order('name') }
   
  # Validations
  validates_presence_of :name

end