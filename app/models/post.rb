class Post < ApplicationRecord
  
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_validate

  def clickbait_validate

    if title
      clickbait_words = [
        "Won't Believe",
        "Secret",
        "Top",
        "Guess" 
      ]

      unless clickbait_words.any? { |heading| title.include?(heading)}
        errors.add(:title, "Title must contain clickbait.")
      end

    end

  end

end
