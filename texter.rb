require 'twilio-ruby'
require 'immutable-struct'
require 'csv'

Person = ImmutableStruct.new(:first_name, :graduating_class, :phone_number)

def parse_contacts(csv_filepath:)
	CSV.read(csv_filepath, headers: true).map { |row|
		if row['area_code'] && row['phone_number'] 
			Person.new(first_name: row['first_name'],
				graduating_class: row['class'],
				phone_number: "+1#{row['area_code']}#{row['phone_number']}")
		end

	}.reject(&:nil?)
end

def send_text(recipient:)
	client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
	puts "Sending text to #{recipient.first_name} (#{recipient.graduating_class})"
	client.messages.create(
	  from: ENV['FROM_NUMBER'],
	  to: "#{recipient.phone_number}",
	  body: "Stop playing starcraft")
end	

def main()
	contacts = parse_contacts(csv_filepath: 'sample-contacts.csv')
	contacts.each do |contact|
		send_text(recipient: contact)
	end
end

main