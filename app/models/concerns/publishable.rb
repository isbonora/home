module Publishable
  extend ActiveSupport::Concern

  included do
    default_scope { order(published_at: :desc) }

    # Scopes
    scope :scheduled, -> { where.not(published_at: nil).where("published_at > ?", Date.today) }
    scope :published, -> { where.not(published_at: nil).where("published_at <= ?", Date.today) }
    scope :drafts, -> { where(published_at: nil) }

    def published?
      published_at.present? && published_at <= Date.today
    end

    def scheduled?
      published_at.present? && published_at > Date.today
    end

    def draft
      !published?
    end
  end
end
