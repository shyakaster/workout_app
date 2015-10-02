# == Schema Information
#
# Table name: exercises
#
#  id              :integer          not null, primary key
#  duration_in_min :integer
#  workout         :text(65535)
#  workout_date    :date
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :duration_in_min,presence: true
  validates :duration_in_min,numericality: {only_integer: true}
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true

end
