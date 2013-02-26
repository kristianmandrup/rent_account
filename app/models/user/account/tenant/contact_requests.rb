class User::Account::Tenant
  module ContactRequest
    extend ActiveSupport::Concern

    included do
      field :contact_requests_made, type: Integer, default: 0
    end

    def allow_contact_request?
      contact_requests_made < max_contact_requests
    end

    # subtract contact_requests_made only if tenant 
    # is allowed to make that contact request
    def make_contact_request!
      return unless allow_contact_request?
      contact_requests_made -= 1
      true
    end

    def max_contact_requests
      tenant_package ? tenant_package.contact_requests : 9999
    end
  end
end
