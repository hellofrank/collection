class ArticleCategory < ActiveRecord::Base
  attr_accessible :category
  has_many :article
end
