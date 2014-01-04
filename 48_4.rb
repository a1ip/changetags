# encoding: utf-8
require 'taglib'

Dir.chdir("/Volumes/phil/audiobooks/Bible")
Dir["*.mp3"].each do |chapter|
    # print chapter, "\t"
    if chapter == "rus_48_4.mp3"
    	print chapter, "\t"
		TagLib::MPEG::File.open(chapter) do |file|

		tag = file.id3v2_tag
        # puts tag.title
		title = tag.frame_list('TIT2').first
		# title.text = "Вторая книга Царств"
		# title.text = "Вторая книга Царств" + title.to_s
		print title, "\t"
		artist = tag.frame_list('TPE1').first
		artist = "Библия"
		puts artist # artist.text = "Библия"
		file.save
		end
    end
end