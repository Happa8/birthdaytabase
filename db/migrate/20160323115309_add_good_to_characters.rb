class AddGoodToCharacters < ActiveRecord::Migration
  def change
    add_column :characters ,:good , :integer, default: 0
  end
end
