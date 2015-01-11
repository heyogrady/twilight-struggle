class Util

  def self.log_exception exception
    msg = exception.class.to_s; log msg
    msg = exception.to_s; log msg
    exception.backtrace.each do |line|
      log line
    end
  end

  def self.log msg
    Rails.logger.info msg
    puts msg
  end
  
end
