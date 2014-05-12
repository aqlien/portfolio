class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: {within: 2..150, too_long: "You're naming a project, not writing a book.", too_short: "You should probably name your project something more distinctive."}
end
