module ReadTimeFilter
  def read_time(input)
      words_per_minute = 275
      # number of seconds per image to start at, default is 12s
      img_time_max = 12
      # time per image will decrease by 1 for every image, to a minimum
      # of this time, default is 3s
      img_time_min = 3

      strings = input.split(/<img.* \/>/)

      seconds = (strings.join(" ").split.size.to_f / (words_per_minute / 60))

      # number of images minus one for correct number of iterations
      (strings.size - 2).times do |i|
          t = (img_time_max - i)
          image_time = t > img_time_min ? t : img_time_min
          seconds = seconds + image_time
      end

      minutes = (seconds / 60).ceil

      "#{minutes} min read"
  end
end

Liquid::Template.register_filter(ReadTimeFilter)