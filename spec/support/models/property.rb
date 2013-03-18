class Property
  include Mongoid::Document

  field :name
  field :description

  alias_method :title, :name

  # inverse of has_one :default_property 
  belongs_to :owner,    class_name: 'User::Account::Landlord', inverse_of: :default_property

  # inverse of has_many :properties
  belongs_to :landlord, class_name: 'User::Account::Landlord', inverse_of: :properties

  belongs_to :featured_ads, class_name: 'User::Account::Landlord::Package::FeaturedAds', inverse_of: :properties

  # A property MUST always belong to a landlord
  validates :landlord, presence: true
end
