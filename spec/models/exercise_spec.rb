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

require 'rails_helper'

RSpec.describe Exercise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
