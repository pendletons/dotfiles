begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => e
  puts e
end
