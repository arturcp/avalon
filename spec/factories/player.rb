FactoryGirl.define do
  factory :player do
    name 'John Doe'

    initialize_with { Player.new(name) }

    trait :merlin do
      character FactoryGirl.build(:merlin)
    end

    trait :assassin do
      character FactoryGirl.build(:assassin)
    end
  end
end
