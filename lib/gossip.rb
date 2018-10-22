
class Gossip
	def initialize (author, content)
		@author = author
		@content = content
	end

	attr_reader	:author, :content

	def save
  	CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
    end
	end


	def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  	end

  	return all_gossips
	end

	def self.find(id)
		gossip_row = []
		i = 1
		CSV.foreach("./db/gossip.csv") do |csv_row|
			if i == id.to_i
    		gossip_row = csv_row.inspect    		
  		end

  		i += 1
  	end

  	return gossip_row

	end

end