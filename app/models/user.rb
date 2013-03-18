class User
  # include BasicDocument
  include Mongoid::Document

  attr_accessor :name, :logged_in, :email, :password, :type
end