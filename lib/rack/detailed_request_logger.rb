module Rack
  class DetailedRequestLogger
    def initialize(app, logger)
      @app = app
      @logger = logger
    end

    def call(env)
      # generate log data
      post_data = env["rack.input"].gets
      to = "To: #{env["REQUEST_METHOD"]} #{env["PATH_INFO"]}"
      to << "?#{env["QUERY_STRING"]}" unless env["QUERY_STRING"].nil? || env["QUERY_STRING"].blank?
      entry = ["From IP: #{env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-"}"]
      entry << to
      entry << "Raw POST Data: #{post_data}"
      @logger.info entry.join(", ")
      
      # restore the value of env["rack.input"]
      env["rack.input"] = StringIO.new(post_data) if post_data
      
      # return the app
      status, header, body = @app.call(env)
      [status, header, body]
    end
  end
end