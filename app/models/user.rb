class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns
  has_many :comments

  has_many :discussion_topics, through: :campaigns


  # validates :email, :password, :username, :status, presence: true
  validates :user_type, inclusion: { in: %w(Novice Expert) }
  # validates :status, presence: true
  validates :profession, :service, presence: true, if: :expert?
  enum status: { un_qualified: "un_qualified", qualified: "qualified", banned: "banned" }


  def expert?
    user_type == 'Expert'
  end

  def novice?
    user_type == 'Novice'
  end

  # def can_change_status?
  #   expert?
  # end

  def can_create_campaigns?
    expert?
  end

  def can_create_topics?
    novice? && status == 'qualified'
  end
end
