require 'rubygems'
require 'json'


cmd = `bash get.sh 2> /dev/null`

# puts cmd

dat = JSON.parse(cmd)


out = dat["objs"].each do |obj|
  out = obj["data"]
  puts JSON.pretty_generate(out)
end

# out = dat["objs"][0]["data"]

