class Changed < ActiveRecord::Migration[5.0]
  def change
  	remove_column :types,:type
  	add_column :types,:type_name,:string
  end
end
