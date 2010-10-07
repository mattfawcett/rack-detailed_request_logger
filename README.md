rack-detailed_request_logger
============================
* Logs requests to your RACK app's recording the raw POST, PUT data etc

Usage
-----
     require "rack/google_analytics"
     
     logger = Logger.new("log/app.log")
     use Rack::DetailedRequestLogger, logger