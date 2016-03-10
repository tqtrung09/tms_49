class Task < ActiveRecord::Base
  belongs_to :subject

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
end
