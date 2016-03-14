class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects, dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|task| task[:name].blank?}

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 250}

  enum status: {finish: 0, unfinish: 1}
end
