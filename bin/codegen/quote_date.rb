# Quote date format
while line = gets
  puts line.gsub(/\b(\d{4}-\d{2}-\d{2}(T\d{2}:\d{2}:\d{2}\.\d{3}[+-]\d{2}:\d{2})?)\s*\z/, "'\\1'")
end