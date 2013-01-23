class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link, :unique => true
      t.string :category
      t.text :description
      t.string :subject
      t.date :marked
      t.integer :bcount

      t.timestamps
    end
  end
end
