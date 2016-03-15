class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :content
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
