

task :output_dir do
  Dir.mkdir 'out' unless File.exists?('out')
end

def openscad_command
  if RUBY_PLATFORM.include? 'darwin'
    return '/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'
  end
  'openscad'
end

def openscad(scad, stl, args) 
    puts ">> Generate #{stl} from #{scad}"
    sh "#{openscad_command} #{args} -o out/#{stl} #{scad}"
end



desc 'germination hive'
task :germination_hive => :output_dir do
  openscad( "main.scad", "germination-pod.stl", "-D 'height=60' -D 'width=2' -D 'diameter=60'" )
end

desc 'create a more complex version'
task :complex_version => :output_dir do
    bottle_height   = 80
    bottle_diameter = 80
    filter_diameter = 50
    filter_height   = 8
    nossle_diameter = 5
    nossle_height   = 10
   openscad( "make_filter.scad", "complex_filter.stl", "-D 'diameter=#{filter_diameter}' -D 'height=#{filter_height}'" )
   openscad( "make_bottle.scad", "complex_bottle.stl", "-D 'diameter=#{bottle_diameter}' -D 'height=#{bottle_height}' -D 'filter_diameter=#{filter_diameter}' -D 'filter_height=#{filter_height}' -D 'nossle_diameter=#{nossle_diameter}' -D nossle_height=#{nossle_height}" )
end

