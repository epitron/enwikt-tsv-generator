if ARGV.empty?
  puts "usage: stats.rb tsv/<tsv-file>.gz"
  exit 1
end

require 'epitools'

all = Hash.of_integers

zopen(ARGV.first) do |io|
  last = nil
  count = 0
  io.each_line do |line|
    lang, word, *rest = line.split("\t")
 
    pair = [lang, word]
    next if pair == last

    all[lang] += 1
    last = pair
 
    count += 1
    $stderr.print "\e[1Gwords processed: #{count.commatize}\e[J" if count % 137 == 0
  end
end

$stderr.puts
pp all.to_a.sort_by(&:last)
