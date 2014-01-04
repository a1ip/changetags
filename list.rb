# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    print chapter, "\t"
	TagLib::MPEG::File.open(chapter) do |file|
		tag = file.id3v2_tag
		title = tag.frame_list('TIT2').first
		print title, "\t"
		artist = tag.frame_list('TPE1').first
		puts artist
	end
end