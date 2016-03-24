class CreateCharatag < ActiveRecord::Migration
  def change
    create_table :charatags do |t|
      t.string :chara_id
      t.string :tag_id
    end
  end
end
