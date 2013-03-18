class User
  module Account
    class Base < ::Account::Base
      include Mongoid::Document
    end
  end
end