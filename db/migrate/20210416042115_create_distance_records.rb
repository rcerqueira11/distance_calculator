class CreateDistanceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :distance_records do |t|
      t.string :initial_point
      t.string :final_point
      t.float :distance_in_between

      t.timestamps
    end
  end
end
