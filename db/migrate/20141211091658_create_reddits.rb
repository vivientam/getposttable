class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
    	t.string :title
    	t.string :comment
      t.timestamps
    end
  end
end
