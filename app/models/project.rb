class Project < ApplicationRecord

  has_many :employees_projects
  has_many :developers, through: :employees_projects, source: :employee
  has_and_belongs_to_many :technologies

end
