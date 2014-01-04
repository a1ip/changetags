# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    if chapter =~ /rus_10_/
    	print chapter, "\t"
		TagLib::MPEG::File.open(chapter) do |file|
			tag = file.id3v2_tag
			title = tag.frame_list('TIT2').first
			title.text = "Вторая книга Царств" + title.to_s
			puts title, "\t"
			file.save
		end
    end
end