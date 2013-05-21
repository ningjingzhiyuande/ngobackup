class Ngo < ActiveRecord::Base
  attr_accessible :info, :name, :position,:url
  has_many :assets , :as => :attachable, :dependent => :destroy
end
