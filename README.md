rack-detailed_request_logger
============================
* Logs requests to your RACK app's recording the raw POST, PUT data etc

Usage
-----
     require "rack/detailed_request_logger"
     
     logger = Logger.new("log/app.log")
     use Rack::DetailedRequestLogger, logger
     
Sample Output
-------------
    I, [2010-10-07T10:59:58.072869 #1523]  INFO -- : From IP: 127.0.0.1, To: POST /docs, Raw POST Data: YOYO=KK
    I, [2010-10-07T11:00:01.853890 #1523]  INFO -- : From IP: 127.0.0.1, To: GET /docs, Raw POST Data: