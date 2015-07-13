require "easy_rr/version"

module EasyRr
  def self.matches(participants,*facingMatches)

  	if participants.class != Array
		participants = participants.to_a
  	end

    fMatches = !facingMatches[0].nil? ? facingMatches[0] : 1

    if participants.size%2 != 0
    	participants.push nil
    end

    length = participants.size
    last_e = participants.pop

    matches = ( ( ( fMatches*length )/2 ) + fMatches ).times.map do
      participants.rotate!
      [[participants.first, last_e]] + (1...(length / 2)).map { |j| [participants[j], participants[length - 1 - j]] }
    end

    unless last_e.nil?
    	participants.push last_e
    end
    
    return matches
  end
end
