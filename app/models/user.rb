class User
  include Mongoid::Document

  attr_accessor :name, :logged_in, :email, :password, :type

  embeds_many :accounts, as: :account
end