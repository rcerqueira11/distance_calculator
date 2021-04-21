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
class DistanceRecord < ApplicationRecord
  validates_presence_of [:initial_point, :final_point, :distance_in_between]

end
