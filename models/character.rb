ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Character < ActiveRecord::Base
    #acts_as_taggable_on :labels # post.label_list が追加される
    #acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
    has_many :charatags
end

class Tag < ActiveRecord::Base
    has_many :charatags
end

class Charatag < ActiveRecord::Base
    belongs_to :characters
    belongs_to :tags
end