require 'petname'
pn = PetName::Generator.new

# returns random name consisted of two words and separated with '-'
name =  pn.generate(words:1 )# => e.g. "intercentral-parthenia"

# Get the current time
current_time = Time.now

# Format the time
formatted_time = current_time.strftime("%Y%m%d-%H%M")

# Output the formatted time
puts 'cwa-tests-' + formatted_time + '-' + name