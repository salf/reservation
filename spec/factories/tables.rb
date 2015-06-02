FactoryGirl.define do
  factory :table, class: 'Table' do
    sequence(:name) { |n| "vip-table#{n}" }
    person_volume { rand(10) }
  end

end
