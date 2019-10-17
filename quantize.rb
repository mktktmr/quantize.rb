require 'rubygems'
require 'rmagick'
include Magick

Dir.glob('resource/*').each do |f|
  puts filename = File.basename(f)

  img = ImageList.new(f)

  puts "============= Before quantize ============="
  puts "colorspace: #{  img.colorspace }, filesize: #{ img.filesize / 1024 } KB"

  quantized_img = img.quantize(img.number_colors, Magick::ColorspaceType::SRGBColorspace)
  quantized_img.write("output/quantized_#{ filename }")

  puts "============= Aefore quantize ============="
  puts File.basename(quantized_img.filename)
  puts "colorspace: #{  quantized_img.colorspace }, filesize: #{ quantized_img.filesize / 1024 } KB"
  puts "\r"
end

