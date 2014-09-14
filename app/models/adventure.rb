class Adventure < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :chapters
  validates :user_id, presence: true
  validates :title, presence: true

  def add_chapter chapter
    self.chapters << chapter
  end
end