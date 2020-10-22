class User < ApplicationRecord
  has_secure_password

  has_one_attached :cvFile

  after_initialize :set_defaults, unless: :admin?

  def set_defaults 
    self.admin =  false
  end
  enum gender: [:female, :male]

  validates :name,  
            presence: true  
 
  validates :email,  
            presence: true,  
            uniqueness: true,  
            format: {  
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
            }  
  validates :mobile,
  			format:{
  				with: /\A\d{10}\z/
  			}

  def numeric_gender
    self.class.genders[gender]
  end
end
