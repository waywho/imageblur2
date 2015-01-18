class ImageBlur
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
			print row.join("")
			puts
		end
	end

	def locate_pixl
		locus = []
		@image.each_index do |row_index|
			sub_image = @image[row_index]
			sub_image.each_index do |pixl_index|
				if sub_image[pixl_index] == 1
					locus << [row_index, pixl_index]
				end
			end
		end
		return locus
	end

	def blur_image
		pixl_locus = self.locate_pixl
		pixl_locus.each do |row, pixl|
		blur_action = {
			:up => @image[row - 1][pixl] = 1,
			:down => @image[row + 1][pixl] = 1,
			:left => @image[row][pixl - 1] = 1,
			:right => @image[row][pixl + 1] = 1
		}
			if row == 0
				if pixl == 0 
					blur_action[:down] 
					blur_action[:right]
				elsif @image[pixl + 1].nil?
					blur_action[:down]
					blur_action[:left]
				else
					blur_action[:down]
					blur_action[:right]
					blur_action[:left]
				end
			elsif @image[row + 1].nil?
				if pixl == 0 
					blur_action[:up]
					blur_action[:right]
				elsif @image[pixl + 1].nil?
					blur_action[:up]
					blur_action[:left]
				else
					blur_action[:up]
					blur_action[:right]
					blur_action[:left]
				end
			elsif pixl == 0
				blur_action[:up]
				blur_action[:down]
				blur_action[:right]
			elsif @image[row][pixl + 1].nil?
				blur_action[:up]
				blur_action[:down]
				blur_action[:left]
			else
				blur_action[:up]
				blur_action[:down]
				blur_action[:right]
				blur_action[:left]
			end
		end
	end
end

image = ImageBlur.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur_image
image.output_image
puts

image = ImageBlur.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur_image
image.output_image
puts

image = ImageBlur.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur_image
image.output_image