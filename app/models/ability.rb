class Ability
    include CanCan::Ability
  
    def initialize(user)
      # set user to new User if not logged in
      user ||= Owner.new # i.e., a guest user
      
      # set authorizations for different user roles
      if user.worker?
        # they get to do it all
        can :manage, :all

      elsif user.client?
        # they can read their own data
        can :show, Owner do |this_owner|  
          user == this_owner
        end
  
        # they can see lists of pets and visits (controller filters automatically)
        can :index, Pet
        can :index, Visit
  
        # they can read their own pets' data
        can :show, Pet do |this_pet|  
          my_pets = user.pets.map(&:id)
          my_pets.include? this_pet.id 
        end
  
        # they can read their own visits' data
        can :show, Visit do |this_visit|  
          my_visits = user.visits.map(&:id)
          my_visits.include? this_visit.id 
        end
  
        
      else
        # guests can only read animals covered (plus home pages)
        # can :read, Animal
      end
    end
  end