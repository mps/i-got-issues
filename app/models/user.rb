class User < ActiveRecord::Base
  # column :name

  # column :email

  # column :created_at

  # column :updated_at
  
  has_many :services
end
