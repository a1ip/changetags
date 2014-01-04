# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
	print chapter, "\t"
	TagLib::MPEG::File.open(chapter) do |file|
		tag = file.id3v2_tag
		title = tag.frame_list('TIT2').first
		title.text = title.to_s.gsub! ", ", ", глава "
		puts title, "\t"
		file.save
	end
end