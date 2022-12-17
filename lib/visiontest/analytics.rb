module VisionTest
  module Analytics
    if !File.directory?("#{ROOT_DIR}/analytics")
      Dir.mkdir("#{ROOT_DIR}/analytics")
      File.write("#{ROOT_DIR}/analytics/keypresses.json", {}.to_json, mode: "w")
    end

    def record_keypress_analytics(key)
      analytics = JSON.parse(File.read("#{ROOT_DIR}/analytics/keypresses.json"))
      analytics[key] = 0 if !analytics[key]
      analytics[key] = analytics[key] + 1
      File.write("#{ROOT_DIR}/analytics/keypresses.json", analytics.to_json, mode: "w")
    end

    module_function :record_keypress_analytics
  end
end
