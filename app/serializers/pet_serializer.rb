class PetSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :active, :date_of_birth
    attribute :female do |object|
        object.female ? "Yes" : "No"
      end
    attribute :animal do |object|
        object.animal.name
    end
  end
  