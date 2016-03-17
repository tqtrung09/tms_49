class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :course_subjects, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 250}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_must_be_greater_than_start_date

  after_update :create_user_subject

  enum status: {start: 0, finish: 1}
  private
  def end_date_must_be_greater_than_start_date
    errors.add :base, I18n.t("views.course.error_date") if
      self.end_date < self.start_date
  end

  def create_user_subject
    if self.finish?
      self.course_subjects.each do |course_subject|
        self.users.each do |user|
          course_subject.user_subjects.create user: user
        end
      end
    end
  end
end
