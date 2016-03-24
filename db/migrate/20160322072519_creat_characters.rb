class CreatCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
        t.string :name
        t.string :date
        
        t.timestamps 
      end
  end
end
