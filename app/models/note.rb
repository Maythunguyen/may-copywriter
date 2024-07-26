class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_rich_text :enhanced_content
end
