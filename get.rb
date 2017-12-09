require 'rubygems'
require 'json'

cmd = `bash get.sh 2> /dev/null`

hash = { :temps => [] }

dat = JSON.parse(cmd)


dat["objs"].each do |obj|
  d = obj["data"]
  # puts JSON.pretty_generate(d)
  is_temp = false
  temps = []
  d.each do |measure|
    # if measure == "Temperature Sensor"
    #   puts "hit"
    # end
    # if measure[1] == "Temperature Sensor"
    #   puts JSON.pretty_generate(measure)
    # end
    # puts JSON.pretty_generate(measure)
    if is_temp == true
      temps.push(measure[1])
      # puts measure[1]
      is_temp = false
    end
    
    if measure[1] == "Temperature Sensor"
      is_temp = true
    end
    
  end
  # puts JSON.pretty_generate(out)
  puts temps
  
end


# out = dat["objs"][0]["data"]

