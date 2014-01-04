# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    print chapter, "\t"
    if chapter != "rus_48_4.mp3"
		TagLib::MPEG::File.open(chapter) do |file|

		tag = file.id3v2_tag
        # puts tag.title
		title = tag.frame_list('TIT2').first
		print title, "\t"
		# title.text = "Бытие, глава 1"
		artist = tag.frame_list('TPE1').first
		puts artist # artist.text = "Библия"
		# file.save
		end
    end
end