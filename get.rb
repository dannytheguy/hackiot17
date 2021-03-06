require 'rubygems'
require 'json'


@output = { :devices => [] }

def grab_data(device_name)
  cmd = `bash #{device_name}.sh 2> /dev/null`
    
  dat = JSON.parse(cmd)
  temps = []
  baros = []

  dat["objs"].each do |obj|
    time = obj["createDate"]["$date"]
    d = obj["data"]
    # puts JSON.pretty_generate(d)
    is_temp = false
    is_baro = false
    
    d.each do |measure|
      if is_temp == true
        temps.push([time,measure[1]])
        is_temp = false
      elsif is_baro == true
        baros.push([time,measure[1]])
        is_baro = false
      end    
      if measure[1] == "Temperature Sensor"
        is_temp = true
      elsif measure[1] == "Barometer"
        is_baro = true
      end
    end  
  end
  return { :name => device_name, :temp => temps[temps.length-1], :baro => baros[baros.length-1] }
end

data_dan = grab_data('data_dan')
data_dimi = grab_data('data_dimi')
data_brian = grab_data('data_brian')

@output[:devices].push(data_dan,data_dimi,data_brian)

puts JSON.pretty_generate(@output)

File.open("out.json", 'w') { |file| file.write(JSON.pretty_generate(@output)) }
File.open("continuous_out.json", 'a') { |file| file.write(JSON.pretty_generate(@output)) }


