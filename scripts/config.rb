require "argparse"
require "json"
require "socket"
require_relative "../lib/visiontest/vtac/packet.rb"
require_relative "../lib/visiontest/dvc/packet.rb"

o = {
  load: { has_argument: true },
  save: { has_argument: true },
  password: { has_argument: true }
}

s = {}

args = ArgsParser::Args.new(options: o, switches: s)

# Connect to server

server = TCPSocket.new(args.data[0], 5582)

id_server = VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)[:contents].split("~")
server.puts VisionTest::VTAC::Packet.new(:id_client, "vtac_client")

if id_server[2] == "authreq"
  if args.options[:password]
    server.puts VisionTest::VTAC::Packet.new(:password, args.options[:password].to_s)

    resp = VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)

    if resp[:type] == "error"
      STDERR.puts resp[:contents]
      exit 1
    end
  else
    STDERR.puts "ERROR: Server requires authentication. Please re-run with the `--password` argument"
    exit 1
  end
end


if args.options[:save] # Export data
  data = {}
  
  data[:name] = id_server[0]
  data[:version] = id_server[1]
  data[:auth] = id_server[2] ? true : false

  # Config options

  data[:config] = {}

  server.puts VisionTest::VTAC::Packet.new(:command, "config pxsize")
  data[:config][:pxsize] = VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)[:contents].to_i

  server.puts VisionTest::VTAC::Packet.new(:command, "config roomlength")
  data[:config][:roomlength] = VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)[:contents]

  server.puts VisionTest::VTAC::Packet.new(:command, "config mirrored")
  data[:config][:mirrored] = VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)[:contents].to_i

  # DVC

  server.puts VisionTest::VTAC::Packet.new(:command, "dvcenable")
  data[:dvcenabled] = (VisionTest::VTAC::Packet.new(from_packet: server.gets.chomp)[:contents] == "true" ? true : false)

  if data[:dvcenabled]
    server_dvc = TCPSocket.new(args.data[0], 5583)
    id_server_dvc = VisionTest::DVC::Packet.new(from_packet: server_dvc.gets.chomp)[:contents].split("~")
    server_dvc.close

    data[:dvcauth] = id_server_dvc[2] ? true : false
  else
    data[:dvcauth] = false
  end

  puts data.to_json
end
