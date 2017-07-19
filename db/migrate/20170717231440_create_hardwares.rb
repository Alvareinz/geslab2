class CreateHardwares < ActiveRecord::Migration[5.0]
  def change
    create_table :hardwares do |t|
      t.references :type, foreign_key: true
      t.string :serie
      t.boolean :status

      t.timestamps
    end
  end
end
