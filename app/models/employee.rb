class Employee < ApplicationRecord

  has_many :employees_projects
  has_many :projects, through: :employees_projects

end
