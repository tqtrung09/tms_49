class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject

  has_many :user_tasks, dependent: :destroy

  enum status: {start: 0, finish: 1}
end
