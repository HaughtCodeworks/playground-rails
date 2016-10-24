class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :lists, through: :projects
  has_many :items, through: :lists
end
