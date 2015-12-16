class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :cohorts, :users do |t|
      t.index [:cohort_id, :user_id]
      t.index [:user_id, :cohort_id]
    end
  end
end
