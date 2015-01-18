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
			if row == 0
				if pixl == 0 
					@image[row + 1][pixl] = 1
					@image[row][pixl + 1] = 1
				elsif @image[pixl + 1].nil?
					@image[row + 1][pixl] = 1
					@image[row][pixl - 1] = 1
				else
					@image[row + 1][pixl] = 1
					@image[row][pixl - 1] = 1
					@image[row][pixl + 1] = 1
				end
			elsif @image[row + 1].nil?
				if pixl == 0 
					@image[row - 1][pixl] = 1
					@image[row][pixl + 1] = 1
				elsif @image[row][pixl + 1].nil?
					@image[row - 1][pixl] = 1
					@image[row][pixl - 1] = 1
				else
					@image[row - 1][pixl] = 1
					@image[row][pixl - 1] = 1
					@image[row][pixl + 1] = 1
				end
			elsif pixl == 0
				@image[row - 1][pixl] = 1
				@image[row + 1][pixl] = 1
				@image[row][pixl + 1] = 1
			elsif @image[row][pixl + 1].nil?
				@image[row - 1][pixl] = 1
				@image[row + 1][pixl] = 1
				@image[row][pixl - 1] = 1
			else
				@image[row - 1][pixl] = 1
				@image[row + 1][pixl] = 1
				@image[row][pixl - 1] = 1
				@image[row][pixl + 1] = 1
			end
		end
	end
end


image = ImageBlur.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
])

image.locate_pixl
image.blur_image
image.output_image


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