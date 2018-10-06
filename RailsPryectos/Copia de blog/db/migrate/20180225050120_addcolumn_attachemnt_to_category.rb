class AddcolumnAttachemntToCategory < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :categories, :cat_img
  end
end