require "sinatra"
require "sinatra/reloader"

string = ""
shift = 0

def encrypt(sentence, shifts)
	shifts = shifts.to_i
	chars = sentence.split('')
	chars_enc = chars.map do |char| 
	case char.ord
		when 65..122 then if (char.ord + shifts) > 122 then (char.ord + shifts - 58).chr else (char.ord + shifts).chr end
		else char
	end
	end
	string_enc = chars_enc.join
	string_enc 
end

def decrypt(sentence, shifts)
	shifts = shifts.to_i
	chars = sentence.split('')
	chars_enc = chars.map do |char| 
	case char.ord
		when 65..256 then if (char.ord - shifts) < 65 then (char.ord - shifts +58).chr else (char.ord - shifts).chr end
		else char
	end
	end
	string_enc = chars_enc.join
	string_enc 
end


get "/" do
	erb :index, :locals => {:message => nil}
end

post "/" do
	if params["decision"]=="Encrypt" then
	message = encrypt(params["string"], params["shift"])
	end
	if params["decision"]=="Decrypt" then
	message = decrypt(params["string"], params["shift"])
	end
	erb :index, :locals => {:string => string, :shift => shift, :message => message}

end