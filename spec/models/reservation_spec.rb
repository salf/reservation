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
    let!(:reservation) { create(:reservation,
                                 start_time: Time.now,
                                 end_time:   Time.now + 2.hours
                       )}

    it "should not allows times overlaping for the same table" do
      reservation_next = build( :reservation, {
                                   end_time: (Time.now + 1.hour),
                                   table: reservation.table
                                })
      expect(reservation_next.valid?).to be(false)
    end

    it "should not allows times overlaping with outside start & end times" do
      reservation_next = build( :reservation, {
                                   start_time: (reservation.start_time - 10.minutes),
                                   end_time: (reservation.end_time + 10.minutes),
                                   table: reservation.table
                                })
      expect(reservation_next.valid?).to be(false)
    end

    it "should allows to create reservation for the same table and different times" do
      reservation_next = build( :reservation, {
                                   start_time: (reservation.end_time + 1.minute),
                                   end_time: (Time.now + 2.5.hours),
                                   table: reservation.table
                                })
      expect(reservation_next.valid?).to be(true)
    end

    it "should allows to create reservation with times overlaping, different tables" do
      reservation_next = build(:reservation, end_time: (Time.now + 1.hour))
      expect(reservation_next.valid?).to be(true)
    end

    it "should allows to update client_name for valid record" do
      reservation.client_name = 'Sarah Connor'
      expect(reservation).to be_valid
    end

    it "should allows to update time for valid record without time overlaping" do
      valid_reserv = create(:reservation, {
                               start_time: (Time.now + 3.hours),
                               end_time: (Time.now + 4.hours),
                               table: reservation.table
                            })

      valid_reserv.end_time = Time.now + 3.5.hours
      expect(valid_reserv).to be_valid
    end

    it "should not allows to update time for valid record with time overlaping" do
      valid_reserv = create(:reservation, {
                               start_time: (Time.now + 5.hours),
                               end_time: (Time.now + 6.hours),
                               table: reservation.table
                            })

      valid_reserv.start_time = Time.now + 1.hour
      expect(valid_reserv).to_not be_valid
    end

  end
end
