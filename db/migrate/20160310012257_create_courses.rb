class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :content
      t.integer :status
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
