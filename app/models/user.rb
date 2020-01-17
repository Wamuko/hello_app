class User < ApplicationRecord
  has_secure_password validations: false
  
  validate do |record|
    record.errors.add(:password, :blank) unless record.password_digest.present?
  end
  
  validates :user_id, length: { in: 6..20 },
                      format: { with: /\A[a-zA-Z0-9]+\z/ },
                      uniqueness: true,
                      presence: true
  validates :password, length: { in: 8..20 },
                      format: { with: /\A[!-~]+\z/ },
                      presence: true
  validates :nickname, length: { maximum: 30 },
                      format: { with: /\A[ -~]+\z/ },
                      allow_nil: true
  validates :comment, length: { maximum: 100 },
                      format: { with: /\A[ -~]+\z/ },
                      allow_nil: true
end
