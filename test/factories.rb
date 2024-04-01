FactoryBot.define do 

  factory :owner do
    first_name "Alex"
    last_name "Heimann"
    street "10152 Sudberry Drive"
    city "Wexford"
    state "PA"
    zip "15090"
    active true
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    email { |a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
    username "alex"
    password "secret"
    password_confirmation "secret"
  end
  
  factory :pet do
    name "Dusty"
    female true
    active true
    date_of_birth 10.years.ago
    association :owner  # don't have to put the word association in front, but I think it helps...
  end
  
  factory :visit do
    association :pet 
    date 6.months.ago.to_date
    weight 5.0
    overnight_stay false
    total_charge 5000
  end

end