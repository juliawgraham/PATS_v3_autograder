module Contexts
    module Abilities
      def create_abilities
        create_owners
        @worker = FactoryBot.create(:owner, first_name: "worker", username: "worker", role: "worker")
        @worker_ability = Ability.new(@worker)

        @alex_ability = Ability.new(@alex)
        @chris = FactoryBot.create(:owner, first_name: "chris", username: "chris", role: "client")
        @chris_ability = Ability.new(@chris)
        
        # created related objects for testing
        create_animals
        create_pets
        create_visits
      end
  
      def delete_abilities
        destroy_visits
        destroy_pets
        destroy_animals
        destroy_owners
      end
  
    end
  end