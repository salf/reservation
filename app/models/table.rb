class Table < ActiveRecord::Base
  has_many :reservations

  validates :person_volume, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where active: true }
  scope :sorted, -> { order(:position) }

  def name_anyway
    name_changed? ? changed_attributes[:name] : name
  end
end
