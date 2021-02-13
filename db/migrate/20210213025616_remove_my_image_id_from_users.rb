class RemoveMyImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :my_image_id, :string
  end
end
