class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_one :parent, class_name: 'Chapter', foreign_key: 'parent_id'
  validates :prompt, presence: true

  def add_choice prompt
  	Chapter.create(prompt: prompt, parent_id: self.id) unless prompt.nil?
  end

  def choices
  	Chapter.where(parent_id: self.id)
  end
end 