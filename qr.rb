require "rqrcode"

# URL QRCODE
p "What website would you like to visit?"
website = gets.chomp

qrcode_url = RQRCode::QRCode.new("https://www.#{website}.com")
# qrcode_url = RQRCode::QRCode.new("https://www.google.com")

png1 = qrcode_url.as_png({:size => 500})

IO.binwrite("url.png", png1.to_s)
####################
# WIFI QRCODE

# wifi_qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:JI;P:z0ef7mbc7n8ho;;")
wifi_qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:Samsung Galaxy S7 edge 0109;P:Killbill;;")

png2 = wifi_qrcode.as_png({:size => 500})

IO.binwrite("wifi.png", png2.to_s)

##############
p "Who would you like to text?"
phone_num = gets.chomp
p "What would you like to say?"
text_contents = gets.chomp
text_qrcode = RQRCode::QRCode.new("SMSTO:#{phone_num}:#{text_contents}")

png3 = text_qrcode.as_png({:size => 500})

IO.binwrite("text.png", png3.to_s)
