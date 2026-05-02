class Article < ActiveRecord::Base
  belongs_to :user # class_name: "users", foreign_key: "users_id"
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
end
