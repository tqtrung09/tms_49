class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable

  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :user_subjects, dependent: :destroy
  has_many :users, through: :user_tasks, dependent: :destroy
end
