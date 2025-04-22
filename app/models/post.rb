class Post < ApplicationRecord
  has_rich_text :content

  ALLOWED_STATUSES = %w[draft published archived].freeze
  ALLOWED_CATEGORIES = %w[big words small].freeze

  validates :title, presence: true
  validates :description, presence: true

  validates :author, presence: true

  validates :status, inclusion: { in: ALLOWED_STATUSES }
  validates :category, inclusion: { in: ALLOWED_CATEGORIES }

  validates :redirect_link, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }


  scope :published, -> { where(status: "published") }
end
