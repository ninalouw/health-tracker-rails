class Food < ApplicationRecord

  validates :title, presence: true,
                  uniqueness: { case_sensitive: false,
                                message: 'must be unique' }

  validates :calories, presence: true
  belongs_to :category
  belongs_to :user

    def user_full_name
    if user
      user.full_name
    else
      'Anonymous'
    end
  end

  def user_first_name
    user ? user.first_name : 'Anonymous'
  end

  def user_last_name
    user ? user.last_name : 'Anonymous'
  end

  private

  def titleize_name
    self.name = name.titleize if name.present?
  end

end
