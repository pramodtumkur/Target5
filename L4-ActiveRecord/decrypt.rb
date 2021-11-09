require 'aes'

sourceFile = ARGV[0]
password = ARGV[1]
decrypted = AES.decrypt(File.read(sourceFile), password)
File.write("Decrypted.txt", decrypted)


#target_file = "#{sourceFile}.enc"
#File.open(target_file, "wb") {|f| f.write(decrypted)}
#puts "File decrypted to #{target_file} with password #{pas
