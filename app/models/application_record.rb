class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :email
end
