class TakeAction < ActiveRecord::Base

  before_save :welcome_home

  validates :firstname, :lastname, :email, presence: true, allow_blank: false

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email

  validates :zipcode, format: {
                        :with => %r{\d{5}(-\d{4})?},
                        on: :create,
                        :message => "should be 12345 or 12345-1234" },
                      if: Proc.new { |a| a.is_us_based? }

  validates :firstname, format: { with: /\A[a-zA-Z]+\z/,
                                  message: "only allows letters" }

  validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
                                 message: "only allows letters" }

  validates :city, format: { with: /\A[a-zA-Z]+\z/,
                             message: "only allows letters" }
                             
  validates :country, format: { with: /\A[a-zA-Z]+\z/,
                            message: "only allows letters" }


  def is_us_based?
    self.us_based
  end

  private
    def welcome_home
      if is_us_based?
        self.country = "US"
      end
    end
end
