class Post < ApplicationRecord
  include Sluggable
  include Publishable

  has_rich_text :content

  ALLOWED_CATEGORIES = %w[project written small ddr misc].freeze

  validates :title, presence: true
  validates :description, presence: true

  validates :author, presence: true

  validates :category, inclusion: { in: ALLOWED_CATEGORIES }

  validates :redirect_link, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
end
