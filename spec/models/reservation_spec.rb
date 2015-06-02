require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:table)}
  it { should validate_presence_of(:table) }
  it { should validate_presence_of(:client_name) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }


  context "#client_name_anyway" do
    let!(:reservation) { create(:reservation) }

    it "should return origin client_name" do
      name = reservation.client_name
      reservation.client_name = ''
      expect(reservation.client_name_anyway).to eq(name)
    end
  end

  context "validations" do
    let!(:reservation) { create(:reservation) }

    it "should validates times overlaping for the same table" do
      reservation_next = build( :reservation, {
                                   end_time: (Time.now + 1.hour),
                                   table: reservation.table
                                })
      expect(reservation_next.valid?).to be(false)
    end

    it "should validation pass for the same table and different times" do
      reservation_next = build( :reservation, {
                                   start_time: (reservation.end_time + 1.minute),
                                   end_time: (Time.now + 122.minutes),
                                   table: reservation.table
                                })
      expect(reservation_next.valid?).to be(true)
    end

    it "should validates times overlaping, different tables" do
      reservation_next = build(:reservation, end_time: (Time.now + 1.hour))
      expect(reservation_next.valid?).to be(true)
    end
  end
end
