if !File.directory?("./analytics")
  Dir.mkdir("analytics")
  File.write("analytics/keypresses.json", {}.to_json, mode: "w")
end

def record_keypress_analytics(key)
  analytics = JSON.parse(File.read("analytics/keypresses.json"))
  analytics[key] = 0 if !analytics[key]
  analytics[key] = analytics[key] + 1
  File.write("analytics/keypresses.json", analytics.to_json, mode: "w")
end

