#!/home/prajjwal/.rbenv/shims/ruby

# echo 'hello world' | idiot.rb
# => HeLlO wOrLd

ARGF.each_line do |line|
  line.gsub!(/[a-z]/i).with_index do |letter, index|
    index.even? ? letter.upcase : letter.downcase
  end

  puts line
end
