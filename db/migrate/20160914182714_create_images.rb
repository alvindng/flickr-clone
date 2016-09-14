class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :img_file
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
