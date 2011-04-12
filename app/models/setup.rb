# == Schema Information
# Schema version: 20110412151311
#
# Table name: setups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  args       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Setup < ActiveRecord::Base
end
