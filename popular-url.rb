"""
For this question, you are given a log file from a simple web server. Each line in the log file contains a URL and nothing else. Your job is to write code that will download the log file from the internet, process it, and output the most popular URL in the file. You do not need to normalize the URLs in the log files.


You can find the log file at:
https://gist.githubusercontent.com/zach-karat/5787c4beb80339157f971449a438c161/raw/d3814287e4fa93e5e642fa35b9b820d4767d53d4/gistfile1.txt

THE MOST POPULAR URL:
'http://www.example.com' (1170 occurrences)
"""

require 'open-uri'

file_data = open("https://gist.githubusercontent.com/zach-karat/5787c4beb80339157f971449a438c161/raw/d3814287e4fa93e5e642fa35b9b820d4767d53d4/gistfile1.txt") { |f| f.read}

file_data = file_data.split

#puts file_data[0]

fhash = {}

file_data.each do |f|
  fhash[f] = 0
end

file_data.each do |f|
  count = fhash[f]
  fhash[f] = count+1
end

url = ''
most = 0
fhash.each do |h|
  #puts h[0], h[1]
  if h[1].to_int > most
    most = h[1]
    url = h[0]
  end
end
  
puts "Most common is: #{url}"

# {'somevalue' => 7292789 }


#puts "#{fhash['http://www.example.com/living']}"