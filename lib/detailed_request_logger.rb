module Rack
  class DetailedRequestLogger
    def initialize(app, logger)
      @app = app
      @logger = logger
    end

    def call(env)
      to = "To: #{env["REQUEST_METHOD"]} #{env["PATH_INFO"]}"
      to << "?#{env["QUERY_STRING"]}" unless env["QUERY_STRING"].nil? || env["QUERY_STRING"].blank?
      entry = ["From IP: #{env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-"}"]
      entry << to
      entry << "Raw POST Data: #{env["rack.input"].gets}"
      @logger.info entry.join(", ")
      status, header, body = @app.call(env)
      [status, header, body]
    end
  end
end