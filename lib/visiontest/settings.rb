# System settings

$mode = :unix # Change to `:win` on windows machine
if $mode == :win
  STDOUT.puts "WARN: VisionTest no longer supports Windows systems, so some features may not work properly."
end
$windows_serial_port = 'COM4' # Change to appropriate serial port if on windows, disregard if not
