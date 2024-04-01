module Contexts
  module Owners

    def create_owners
      @alex = FactoryBot.create(:owner)
      @rachel = FactoryBot.create(:owner, first_name: "Rachel", username: "rachel", active: false)
      @mark = FactoryBot.create(:owner, first_name: "Mark", username: "mark", phone: "412-268-8211")
    end
    
    def destroy_owners
      @rachel.delete
      @mark.delete
      @alex.delete
    end

  end
end