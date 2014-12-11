class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
    	t.string :student
    	t.string :mark

      t.timestamps
    end
  end
end
