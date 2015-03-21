class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  default_scope { order('updated_at DESC') }
end
