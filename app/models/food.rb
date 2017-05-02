class Food < ApplicationRecord

  validates :title, presence: true,
                  uniqueness: { case_sensitive: false,
                                message: 'must be unique' }

validates :calories, presence: true

end
