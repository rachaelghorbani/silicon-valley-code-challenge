require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
###### STARTUP ######
s1 = Startup.new("Lyft", "Valdet", "www.lyft.com")
s2 = Startup.new("Uber", "Rachael", "www.uber.com")

###### VENTURE CAPITALIST ######
vc1 = VentureCapitalist.new("Judy", 8986666687)
vc2 = VentureCapitalist.new("Valdet", 766666665)

###### FUNDING ROUND ######
fr1 = FundingRound.new(s1, vc1, "Seed", 4445.7)
fr2 = FundingRound.new(s2, vc2, "Forclosure", 5435.1)
fr3 = FundingRound.new(s1, vc2, "Final Sale", 444333.0)
fr4 = FundingRound.new(s1, vc2, "Sale", 433.0)
#binding.pry
0 #leave this here to ensure binding.pry isn't the last line
Pry.start