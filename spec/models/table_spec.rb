require 'rails_helper'

RSpec.describe Table, type: :model do
  it { should have_many(:reservations) }
  it { should validate_presence_of(:person_volume) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }

end
