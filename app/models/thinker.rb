class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class Thinker < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: { 'case-sensitive': false }
  validates :name, length: { in: 5..20}
  validates :email, email: true
  validates :age, numericality: { only_integer: true, allow_nil: true }

  has_secure_password
end
