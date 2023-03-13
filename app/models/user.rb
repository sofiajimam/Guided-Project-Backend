class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true

    # validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    # also validate that the email is unique
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
