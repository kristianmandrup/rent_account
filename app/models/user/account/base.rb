class User
  module Account
    class Base < ::Account::Base
      include Mongoid::Document

      def tenant?
        false
      end

      def landlord?
        false
      end            
    end
  end
end
