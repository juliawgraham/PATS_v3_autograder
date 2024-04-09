require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  # context used for phase 3 only
  create_animals
  create_owners
  create_pets
  create_visits
end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_visits
  destroy_pets
  destroy_owners
  destroy_animals
end

Given /^a logged in user$/ do
  @owner = FactoryBot.create(:owner, first_name: "Ted", username: "ted", role: "worker")
  visit login_path
  fill_in('username', :with => "ted")
  fill_in('password', :with => "secret")
  click_button('Log In')
end
