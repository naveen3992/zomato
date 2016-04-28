require 'elasticsearch/model'

class Restaurant < ActiveRecord::Base

include Elasticsearch::Model
include Elasticsearch::Model::Callbacks

has_many :reviews
belongs_to :user


def as_indexed_json
  
  self.as_json({
    only: [:name, :address, :details]
    
  })

end

def self.search(search)
    
    if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
        find(:all)
    end
end


end

Restaurant.import