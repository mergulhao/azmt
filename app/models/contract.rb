class Contract < ActiveRecord::Base
  belongs_to :student
  belongs_to :classe
end
