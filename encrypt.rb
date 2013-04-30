# a scripts to encrypt all sensitive files
# Jan 1 -09

require 'rubygems'
require 'crypt/blowfish'

unless ARGV[0]
	puts 'Usage: ruby encrypt.rb <finename.txt>'
	exit
end


# Take in the file to encrypt as an argument

#print "Which file to u want to encrypt: "
#filename = gets.chomp

filename = ARGV[0].chomp
puts "The argument is #{filename.capitalize}"


encrypted_file = "Encrypted_#{filename}"


print 'Enter your encryption key( 1 - 56 bytes): '
kee = gets.chomp
puts kee

if File.exists?(encrypted_file)
	puts "File already exists."
	exit
end


	begin
		blowfish = Crypt::Blowfish.new(kee)
		blowfish.encrypt_file(filename.to_s, encrypted_file)
		puts "Encryption SUCCESS"
	rescue Exception => e
		puts "An error occurred:\n #{e}"
	end



