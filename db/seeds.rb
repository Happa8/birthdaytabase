require "csv"

if Character.count == 0
    CSV.foreach('resources/csv/Charas.csv') do |row|
        Character.create(:name => row[1], :date => row[2])
    end
end


if Tag.count == 0
    CSV.foreach('resources/csv/Tags.csv') do |row|
        Tag.create(:tag => row[1] )
    end
end


if Charatag.count == 0
    CSV.foreach('resources/csv/Charas_Tags.csv') do |row|
        Charatag.create(:chara_id => row[0], :tag_id => row[1] )
    end
end

