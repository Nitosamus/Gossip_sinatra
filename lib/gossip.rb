#require "pry"
#require "csv"

class Gossip
	attr_accessor :author, :title

	def initialize(author,title)
		@author = author
		@title = title
	end

	def save
		CSV.open("./db/gossip.csv", "w") do |csv|
		 csv << ["#{self.author}", "#{self.title}"]
		end
		CSV.open("./db/gossip.csv", "r") do |csv|
		puts csv.read
		end
	end

	def self.all 
		all_gossips = []
		CSV.read("./db/gossip.csv") do |csv_line|	
			all_gossips << Gossip.new(csv_line[0],csv_line[1])

			puts all_gossips
		return all_gossips
	end
		end
		

	def self.find(id)
		self.all[id]
		return self.all[id]
	end

end
#system("clear")

#binding.pry


#toble = Gossip.new
#toble.save

