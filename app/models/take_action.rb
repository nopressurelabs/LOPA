class TakeAction < ActiveRecord::Base

  validates :firstname, :lastname, :email, :zipcode, presence: true, allow_blank: false

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email

  validates :firstname, format: { with: /\A[a-zA-Z]+\z/,
                                  message: "only allows letters" }

  validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
                                 message: "only allows letters" }

  validates_format_of :zipcode,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "should be 12345 or 12345-1234"
end
