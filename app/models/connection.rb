class Connection < ActiveRecord::Base

  belongs_to :country
  belongs_to :neighbor, class_name: "Country"

end
