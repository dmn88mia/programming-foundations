
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.map { |k, v| v }.min

# Or --------------------------------------------------------------------

youngest = 0
ages.each do |k, v| 
  youngest += v if youngest == 0
  youngest = v if youngest > v
end

p youngest
# Or ------