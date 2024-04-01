require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of worker users to do everything" do
      create_abilities
      assert @worker_ability.can? :manage, :all
      delete_abilities
    end

    should "verify the abilities of client users in PATS" do
      create_abilities
      # no global privileges
      deny @alex_ability.can? :manage, :all
      # testing particular abilities
      assert @alex_ability.can? :show, @alex
      assert @alex_ability.can? :index, Pet
      assert @alex_ability.can? :index, Visit
      assert @alex_ability.can? :show, @dusty
      deny @alex_ability.can? :show, @pork_chop
      assert @alex_ability.can? :show, @visit1
      visit_pc = FactoryBot.create(:visit, pet: @pork_chop)
      deny @alex_ability.can? :show, visit_pc
      visit_pc.delete
      delete_abilities
    end
  end
end