FactoryGirl.define do
  factory :reservation, class: 'Reservation' do
    table
    client_name 'John'
    start_time { Time.now }
    end_time { Time.now + 2.hours}
  end

end
