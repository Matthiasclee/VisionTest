all_files = `ls photos/normal`.split("\n")

files_i_want = ['']

all_files.each do |f|
  if f[1] == 'C'
    files_i_want << f[2..6]
  end
end

puts files_i_want.to_s
