# Author: Caroline Wheeler
# 5/26/2020

# Is a set
def isSet_test1
puts 'isSet? test1'
card1 = %w[green oval one empty]
card2= %w[green diamond one shaded]
card3 = %w[green squiggle one solid]
result = isSet?(card1, card2, card3)
puts result
end

# Not a set
def isSet_test1
  puts 'isSet? test1'
  card1 = %w[green oval one empty]
  card2= %w[green oval one shaded]
  card3 = %w[green squiggle one solid]
  result = isSet?(card1, card2, card3)
  puts result
end


