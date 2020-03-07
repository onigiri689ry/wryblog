class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false 
      t.text :body,    null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
