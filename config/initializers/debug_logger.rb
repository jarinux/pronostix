dev_log_path = File.join(Rails.root, 'log','debug.log')
dev_log_file = File.open(dev_log_path, 'a')
dev_log_file.sync = true
DebugLogger = Logger.new(dev_log_file)
