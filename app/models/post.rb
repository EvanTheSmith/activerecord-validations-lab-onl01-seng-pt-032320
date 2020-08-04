class Post < ActiveRecord::Base
    validates :title, presence: true
    validate :title_has_spam
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def title_has_spam
        clickbait = Array.[]("Won't Believe", "Secret", "Top [number]", "Guess")
        if title && clickbait.none? {|click| title.include?(click)}
          errors.add(:spam, "Title must be clickbaity.")
        end
    end
end
