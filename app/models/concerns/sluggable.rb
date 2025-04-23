module Sluggable
  extend ActiveSupport::Concern

  included do
     before_validation :sluggify_title, on: :create

     validates :slug, presence: true, uniqueness: true, length: { minimum: 2 }

    # For nice path helpers
    def to_param
      slug
    end

    private

    def sluggify_title
      self.slug = title.parameterize if title.present?
    end
  end
end
