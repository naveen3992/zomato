require 'elasticsearch/model'

class Restaurant < ActiveRecord::Base

#searchkick autocomplete: ['title']

include Elasticsearch::Model
include Elasticsearch::Model::Callbacks

has_many :reviews
has_many :ratings, as: :rateable
belongs_to :user


def as_indexed_json(options={})
  
  as_json({
    only: [:name, :address, :details],
    include: [:reviews]

    
  })

end

def self.search1(search)
    
    if search
        Restaurant.search('search').records.first
        #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
        find(:all)
    end
end

=begin

def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['title^10', 'text']
        }
      },
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          title: {},
          text: {}
        }
      }
    }
  )
end





settings index: { number_of_shards: 1 } do
  mappings dynamic: 'false' do
    indexes :name, analyzer: 'english'
    indexes :details, analyzer: 'english'
  end
end

end



# Delete the previous articles index in Elasticsearch
Restaurant.__elasticsearch__.client.indices.delete index: Restaurant.index_name rescue nil

# Create the new index with the new mapping
Restaurant.__elasticsearch__.client.indices.create \
  index: Article.index_name,
  body: { settings: Restaurant.settings.to_hash, mappings: Restaurant.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Restaurant.import
=end

end