require_relative "mailer.rb"

voters = %w(voter1@post.com voter2@bar.net)

number_of_voters = voters.length

hashes = []
number_of_voters.times do
  o = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
  string = (0...8).map { o[rand(o.length)] }.join
  hashes << string
end

return if hashes.uniq.length < number_of_voters

puts hashes.length
puts hashes
puts "---------------"

hashes.each do |hash|
  voter = voters.sample
  voters.delete(voter)

  Mailer.notification(voter, hash).deliver
end

