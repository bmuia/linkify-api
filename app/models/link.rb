class Link < ApplicationRecord
    validates :url, presence: true, format: URI::regexp(%w[http https])
    validates :short_code, uniqueness: true

    def short
        Rails.application.routes.url_helpers.short_url(short_code: self.short_code, host: 'linkify:3000')
      end
end
