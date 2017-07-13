require "sinatra"
require "sinatra/reloader"

def encrypt
	puts "Insert the sentence to encrypt:"
	sentence = gets.chomp
	puts "How many shifts?"
	shifts = gets.chomp.to_i
	chars = sentence.split('')
	chars_enc = chars.map do |char| 
	case char.ord
		when 65..122  then (char.ord + shifts).chr
		when 122..256 then (char.ord + shifts - 26).chr
		else char
	end
	end
	string_enc = chars_enc.join
	puts string_enc 
end



get "/" do
		erb :index
end