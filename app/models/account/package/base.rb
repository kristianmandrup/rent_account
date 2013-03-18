module Account
  module Package
    class Base
      # include BasicDocument
      include Mongoid::Document

      # the period when this package is active
      # field :period, type: ::Timespan
    end
  end
end
