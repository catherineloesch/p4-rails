class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :job_type
      t.string :location
      t.integer :applications
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :pay

      t.timestamps
    end
  end
end
