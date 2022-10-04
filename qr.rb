require "rqrcode"

puts "What kind of QR Code would you like to generate?"
puts "1. For a website"
puts "2. For a WiFi connection"
puts "3. For a text"
puts "Or press 4 if you would like to exit."

decision = gets.chomp.to_i

while decision != 4

  if decision == 1     # URL QRCODE

    puts "What website would you like to visit?"
    website = gets.chomp

    qrcode_url = RQRCode::QRCode.new("https://www.#{website}.com")
    
    png1 = qrcode_url.as_png({:size => 500})

    IO.binwrite("url.png", png1.to_s)
  
  elsif decision == 2     # WIFI QRCODE

    puts "What network would you like to connect to?"
    network_id = gets.chomp
    puts "What is the password?"
    network_pw = gets.chomp

    # wifi_qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:JI;P:z0ef7mbc7n8ho;;")
    wifi_qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_id}P:#{network_pw};;")

    png2 = wifi_qrcode.as_png({:size => 500})

    IO.binwrite("wifi.png", png2.to_s)

  elsif decision == 3 #TEXT QRCODE

    puts "Who would you like to text?"
    phone_num = gets.chomp
    puts "What would you like to say?"
    text_contents = gets.chomp

    text_qrcode = RQRCode::QRCode.new("SMSTO:#{phone_num}:#{text_contents}")

    png3 = text_qrcode.as_png({:size => 500})

    IO.binwrite("text.png", png3.to_s)
  
  else
    puts "That is not a valid option. Please choose from the given options."
  end
  
  puts "What kind of QR Code would you like to generate?"
  puts "1. For a website"
  puts "2. For a WiFi connection"
  puts "3. For a text"
  puts "Or press 4 if you would like to exit."
  decision = gets.chomp.to_i
  
end
puts "Exiting now."
