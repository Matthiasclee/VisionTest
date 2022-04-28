require "rbtext"

R::Cr.hide
puts "_.c:green._VisionTest Setup".to_ftext
puts "Press _.c:yellow._ENTER_.c:reset._ to start".to_ftext
$stdin.gets
R::Cr.show

lines = File.readlines('js/settings.js')
size = lines[1].gsub(/[^0-9]/, "").to_f

print "Enter the length of the exam room (feet): #{R::C.color :green}"
length = gets.chomp.to_f

R::C.color :reset, mode: :set

size = (size/(20.0/length)).to_i

lines[1] = "  localStorage.pxsize = #{size}\n"

print "Should this tester be mirrored? [yes/no]: #{R::C.color :green}"
mirrored = gets.chomp.downcase[0].to_s

R::C.color :reset, mode: :set

if mirrored == "y"
  lines[4] = "  localStorage.mirrored = 1\n"
elsif mirrored == "n"
  lines[4] = "  localStorage.mirrored = 0\n"
end

File.write('js/settings.js', lines.join)

puts "Setup complete. Press _.c:yellow._ENTER_.c:reset._ to exit.".to_ftext
gets
