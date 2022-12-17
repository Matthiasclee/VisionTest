module VisionTest
  module VTAC
    class Packet
      @@allowed_types = [:command, :response, :id_server, :id_client, :error]

      def initialize(type=:response, contents="", from_packet:nil)
        if !from_packet
          if @@allowed_types.include?(type)
            @type = type
            @contents = contents.to_s
          end
        else
          packet = from_packet
          packet = JSON.parse(packet)
          @type = packet["type"]
          @contents = packet["contents"]
        end

        return self
      end

      def to_h
        return {type: @type.to_s, contents: @contents}
      end

      def to_s
        return self.to_json.to_s
      end

      def to_json
        return self.to_h.to_json
      end

      def [](k)
        return self.to_h[k.to_sym]
      end
    end
  end
end

