# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    puts chapter
	TagLib::MPEG::File.open(chapter) do |file|
		tag = file.id3v2_tag
		artist = tag.frame_list('TPE1').first
		artist.text = "Библия"
		file.save
	end
end