class CreateCharatag < ActiveRecord::Migration
  def change
    create_table :character_tags do |t|
      t.string :character_id
      t.string :tag_id
    end
  end
end
