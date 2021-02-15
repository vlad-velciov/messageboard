module Support
  module Response

    def unauthorized!
      error!("Unauthorized", 403)
    end

    def not_found!
      error!("Not found", 404)
    end

  end
end

