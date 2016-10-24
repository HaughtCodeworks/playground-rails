class List < ApplicationRecord
  belongs_to :project
  has_one :status
  has_many :items
end
