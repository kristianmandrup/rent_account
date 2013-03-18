FactoryGirl.define do
  # system -> tenant
  factory :tenant_account, class: 'User::Account::Tenant' do  
    trait :valid do        
    end

    factory :valid_tenant_account, traits: [:valid]
  end
end
