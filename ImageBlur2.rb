class ImageBlur
	attr_reader :width, :height

	def initialize(image)
		@image = image
		width = @image[1].length - 1
		height = @image.length - 1
		puts "image width: #{width}"
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
		print pixl_locus
		puts

		pixl_locus.each do |row, pixl|
			puts "pixl_num: #{pixl}"
			puts "row_num: #{row}"
			can_move_left = pixl != 0
			can_move_right = pixl != width
			can_move_up = row != 0
			can_move_down = row != height

			puts "can move right? #{can_move_right}"
			
			@image[row][pixl - 1] = 1 if can_move_left
			@image[row][pixl + 1] = 1 if can_move_right
			@image[row - 1][pixl] = 1 if can_move_up
			@image[row + 1][pixl] = 1 if can_move_down
		end

	end

end


image = ImageBlur.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
])

image.blur_image
image.output_image
puts

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