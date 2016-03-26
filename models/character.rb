ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Character < ActiveRecord::Base
    has_many :character_tags
    has_many :tags, through: :character_tags
end

class CharacterTag < ActiveRecord::Base
    belongs_to :character
    belongs_to :tag
end

class Tag < ActiveRecord::Base
    has_many :character_tags
    has_many :characters, through: :character_tags
end
