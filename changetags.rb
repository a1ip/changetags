# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    puts chapter
    if chapter != "rus_48_4.mp3"
		TagLib::MPEG::File.open(chapter) do |file|

		tag = file.id3v2_tag
        # puts tag.title
		# title = tag.frame_list('TIT2').first
		# title.text = "Бытие, глава 1"
		artist = tag.frame_list('TPE1').first
		artist.text = "Библия"
		file.save
		end
    end
end