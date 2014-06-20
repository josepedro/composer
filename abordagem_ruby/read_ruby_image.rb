require 'rubygems'
require 'RMagick'
require 'matrix'

class Array2D
   def initialize(d1,d2)
    @data = Array.new(d1) { Array.new(d2) }
   end

  def [](x, y)
    @data[x][y]
  end

  def []=(x, y, value)
    @data[x][y] = value
  end
end

img = Magick::Image::read("heptagono1.jpg")[0]

img = img.sample(500, 500)

puts "This image is #{img.columns}x#{img.rows} pixels"

img.display


matrix_figure = Array2D.new img.columns, img.rows

img.each_pixel do |pixel, col, row|
	gray_level = 0.2989*pixel.red + 0.5870*pixel.green + 0.1140*pixel.blue
	matrix_figure[col, row] = gray_level
	#puts "Pixel at: #{col}x#{row}: \tR: #{pixel.red}, G: #{pixel.green}, B: #{pixel.blue} gray_level: #{gray_level}"
end

#Calculating the matrix 5,5 to STL
matrix_stl = Array2D.new 5, 5
for column in (0..4)
  for row in (0..4)
    array_average = []
    for coluna in (0 + 100*column .. 99 + 100*column)
      for linha in (0 + 100*row .. 99 + 100*row)
        array_average.push(matrix_figure[coluna, linha])
      end
    end  
      total = array_average.inject(:+)
      len = array_average.length
      average = total.to_f / len
  		matrix_stl[column, row] = average
  end
end

#finding the max and min values
min_value = 0;
max_value = 0; 
for column in (0..4)
  for row in (0..4)
    if matrix_stl[column, row] >= max_value
      max_value = matrix_stl[column, row]
    end
    if matrix_stl[column, row] <= min_value
    min_value = matrix_stl[column, row]
    end
  end
end

#normalizing values of matrix
for column in (0..4)
  for row in (0..4)
    matrix_stl[column, row] = ((matrix_stl[column, row] - min_value))*255/max_value - min_value 
  end
end

def begin_draw(file_stl)
  file_stl.print "solid cube\n\t"
end

def end_draw(file_stl)
  file_stl.print "endsolid"
end

def draw_rectangle(file_stl, point_x, point_y, point_z, height, resolution)
  resolution = resolution * 100
  resolution = resolution/2
  height = 2*height
  position_a = [(-resolution)+point_x,(-resolution)+point_y,(resolution*height)+point_z]
  position_b = [(-resolution)+point_x,(resolution)+point_y,(resolution*height)+point_z]
  position_c = [(-resolution)+point_x,(resolution)+point_y,(-resolution)+point_z]
  position_d = [(-resolution)+point_x,(-resolution)+point_y,(-resolution)+point_z]
  position_e = [(resolution)+point_x,(-resolution)+point_y,(resolution*height)+point_z]
  position_f = [(resolution)+point_x,(resolution)+point_y,(resolution*height)+point_z]
  position_g = [(resolution)+point_x,(resolution)+point_y,(-resolution)+point_z]
  position_h = [(resolution)+point_x,(-resolution)+point_y,(-resolution)+point_z]

  #Base face YZ
  file_stl.print "facet normal -1.000000e+000 0.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  #b
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_b[0], position_b[1], position_b[2]]
  #c
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_c[0], position_c[1], position_c[2]]
  #a
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_a[0], position_a[1], position_a[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal -1.000000e+000 0.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  #a
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_a[0], position_a[1], position_a[2]]
  #c
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_c[0], position_c[1], position_c[2]]
  #d
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_d[0],position_d[1],position_d[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  #Front of face XY
  file_stl.print "facet normal 0.000000e+000 0.000000e+000 1.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_f[0],position_f[1],position_f[2]]
  #b
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_b[0], position_b[1], position_b[2]]
  #e
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_e[0],position_e[1],position_e[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal 0.000000e+000 0.000000e+000 1.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_e[0],position_e[1],position_e[2]]
  #b
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_b[0], position_b[1], position_b[2]]
  #a
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_a[0],position_a[1],position_a[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  #Front of face YZ
  file_stl.print "facet normal 1.000000e+000 0.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_g[0],position_g[1],position_g[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_f[0],position_f[1],position_f[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_h[0],position_h[1],position_h[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal 1.000000e+000 0.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_h[0],position_h[1],position_h[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_f[0],position_f[1],position_f[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_e[0],position_e[1],position_e[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  #Base face XY
  file_stl.print "facet normal 0.000000e+000 0.000000e+000 -1.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  #c
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_c[0],position_c[1],position_c[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_g[0],position_g[1],position_g[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_d[0],position_d[1],position_d[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal 0.000000e+000 0.000000e+000 -1.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_d[0],position_d[1],position_d[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_g[0],position_g[1],position_g[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_h[0],position_h[1],position_h[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  #Front of face XZ
  file_stl.print "facet normal 0.000000e+000 1.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_f[0],position_f[1],position_f[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_g[0],position_g[1],position_g[2]]
  #b
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_b[0], position_b[1], position_b[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal 0.000000e+000 1.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  #b
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_b[0], position_b[1], position_b[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_g[0],position_g[1],position_g[2]]
  #c
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_c[0],position_c[1],position_c[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  #Base face XZ
  file_stl.print "facet normal 0.000000e+000 -1.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_h[0],position_h[1],position_h[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_e[0],position_e[1],position_e[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_d[0],position_d[1],position_d[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n\t"
  
  file_stl.print "facet normal 0.000000e+000 -1.000000e+000 0.000000e+000\n\t\t"
  file_stl.print "outer loop\n\t\t"
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_d[0],position_d[1],position_d[2]]
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_e[0],position_e[1],position_e[2]]
  #a
  file_stl.print "vertex %.6fe-002 %.6fe-002 %.6fe-002\n\t\t" % [position_a[0],position_a[1],position_a[2]]
  file_stl.print "endloop\n\t"
  file_stl.print "endfacet\n"
end

def draw_figure_5x5_cm(matrix_stl)
  width = 5
  roof = 3
  ground = 0.5
  band = width * 20/100
  limit_less = (width - band)/2
  limit_upper = width - limit_less
  file_stl = File.open('figure_5X5.stl', 'w')
  begin_draw(file_stl)
  drawY = 0
  drawX = 0
  for iteratorY in (0..(width - 1))
    for iteratorX in (0..(width - 1))
      valor_matriz = matrix_stl[iteratorX, iteratorY]
      draw_rectangle(file_stl, drawX, drawY, 0, ((valor_matriz)/102 + 0.5), 10)
      drawX = drawX + 1.000000*1000
    end
    drawX = 0;
    drawY = drawY + 1.000000*1000
  end
  end_draw(file_stl)
end

puts matrix_stl[4, 0]

draw_figure_5x5_cm(matrix_stl)

#img = img.scale(0.2)

#puts "This image is #{img.columns}x#{img.rows} pixels"

#img.display
