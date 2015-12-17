class CreateDateRecords < ActiveRecord::Migration
  def change
    create_table :date_records do |t|
      t.string :attendence, default: "present"
      t.date :day
      t.references :student
    end
  end
end
