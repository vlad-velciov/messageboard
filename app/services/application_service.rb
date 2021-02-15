module Services
  module ApplicationService
    def call(*args, &block)
      service = new(*args)
      if block_given?
        service.call(&block)
      else
        service.call
      end
    end
  end
end
