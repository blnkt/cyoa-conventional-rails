class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_one :parent, class_name: 'Chapter', foreign_key: 'parent_id'
  validates :prompt, presence: true
end 