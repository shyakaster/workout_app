class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :workout,:duration_in_min,:workout_date, presence: true
  validates :workout, length: {minimum: 10, maximum: 100}
end
