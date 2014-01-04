# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
TagLib::MPEG::File.open("rus_1_1.mp3") do |file|

  tag = file.id3v2_tag

  title = tag.frame_list('TIT2').first
  title.text = "Бытие, глава 1"
  artist = tag.frame_list('TPE1').first
  artist.text = "Библия"
  file.save
end