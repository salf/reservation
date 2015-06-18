class Reservation < ActiveRecord::Base
  belongs_to :table, -> { where(active: true).order(:position) }

  validates :table,       presence: true
  validates :client_name, presence: true
  validates :start_time,  presence: true
  validates :end_time,    presence: true
  validate :time_frame


  def interval
    [
      start_time.strftime("%H:%M"),
      end_time.strftime("%H:%M")
    ].join(' - ')
  end

  def duration
  end

  def client_name_anyway
    client_name_changed? ? changed_attributes[:client_name] : client_name
  end

  private

  def time_frame
    if Reservation.where("
        table_id = :table_id AND
        #{'id <> :id AND' if id}
        (
          (:s between start_time and end_time OR :e between start_time and end_time)
          OR
          (start_time between :s and :e OR end_time between :s and :e)
        )",
        table_id: table_id,
        id: id,
        s: start_time,
        e: end_time
    ).count > 0
      errors.add(:base, 'Reservation already present for your time frame.')
    end
  end
end
