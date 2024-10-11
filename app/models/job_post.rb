class JobPost < ApplicationRecord
  validates :title, presence: true  
  validates :organization, presence: true
  validates :status, presence: true
  validates :salary, presence: true
  validates :work_days, presence: true
end
