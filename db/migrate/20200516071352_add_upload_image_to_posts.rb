class AddUploadImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :upload_image, :string
  end
end
