class CreateMemories < ActiveRecord::Migration[5.0]
  def change
    create_table :memories do |t|
      t.string :title
      t.string :date
      t.string :location
      t.string :image_name
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
