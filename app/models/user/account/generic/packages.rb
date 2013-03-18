module User::Account::Generic
  module Packages
    # name of package
    def << name
      allowed_package?(name) ? new_package(name) : invalid_package!(name)
    end

    def package name
      unless allowed_package? name
        raise ArgumentError, "Not a valid package for #{account_type}. Must be one of: #{allowed_packages}"
      end
      send(name) ? send(name) : none_for(name)
    end

    def allowed_packages
      []
    end

    def default_packages
      []
    end

    def add_default_packages
      default_packages.each {|name| new_package name }
    end

    protected

    def none_for name
      clazz = package_clazz(name)
      clazz.none
    end

    def account_type
      self.class.to_s.split('::')[2].underscore.to_sym    
    end

    def allowed_package? name
      unless respond_to? :allowed_packages
        raise NotImplementedError, "Method #allowed_packages missing"
      end
      allowed_packages.map(&:to_sym).include? name.to_sym
    end

    def invalid_package! name
      raise ArgumentError, "Unknown or unsupported package: #{name}"
    end

    def new_package name, options = {}
      opts = {packages: self}.merge options
      clazz = package_clazz(name)
      clazz.create opts
    end

    def package_clazz name
      "User::Account::#{account_type.to_s.camelize}::Package::#{name.to_s.camelize}".constantize
    end    
  end
end