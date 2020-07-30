class Alert < ApplicationRecord
  validates :body, presence: true
  validates_format_of :link,
                      allow_blank: true,
                      with: %r{^(http://www\.|https://www\.|http://|https://)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?$}ix, # rubocop:disable Layout/LineLength
                      multiline: true
end
