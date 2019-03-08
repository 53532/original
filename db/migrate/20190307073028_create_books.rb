class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :code
      t.string :title
      t.string :author
      t.string :publisher_name
      t.string :published_date
      t.string :isbn
      t.string :image_url

      t.timestamps
    end
  end
end
