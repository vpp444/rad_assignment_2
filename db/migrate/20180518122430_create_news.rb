class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :url
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
