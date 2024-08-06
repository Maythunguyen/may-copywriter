class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_rich_text :enhanced_content

  validates :content, presence: true
  validates :user, presence: true
end

