class Todo < ActiveRecord::Base
resourcify
belongs_to :user
validates :description, presence: true
validates :user_id, presence: true


end
