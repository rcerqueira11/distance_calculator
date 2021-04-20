# == Schema Information
#
# Table name: distance_records
#
#  id                  :bigint           not null, primary key
#  initial_point       :string
#  final_point         :string
#  distance_in_between :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'test_helper'

class DistanceRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
