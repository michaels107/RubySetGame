#Author:Reema Gupta
# Created on 05/31/2020
# Displays a  60 second timer

require 'time'
t=Time.new(0)
time=60
puts("timer starts")
time.downto(0) do|seconds|
  puts (t+seconds).strftime('%S')
  sleep 1
end




