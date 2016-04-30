FactoryGirl.define do
  factory :player do
    sequence :name do |n|
      "player #{n}"
    end

    initialize_with { Player.new(name) }

    trait :merlin do
      character FactoryGirl.build(:merlin)
    end

    trait :assassin do
      character FactoryGirl.build(:assassin)
    end

    trait :loyal do
      character FactoryGirl.build(:loyal)
    end

    trait :minion do
      character FactoryGirl.build(:minion)
    end
  end
end
