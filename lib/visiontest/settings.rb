# System settings

$mode = :unix # Change to `:win` on windows machine
if $mode == :win
  STDOUT.puts "CRITICAL: VisionTest on windows is no longer supported, and may not work properly. Please switch to using VisionTest on linux as soon as possible."
end
$windows_serial_port = 'COM4' # Change to appropriate serial port if on windows, disregard if not
