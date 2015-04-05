

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

task :foo => :output_dir do
   openscad( "make_filter.scad", "foo_filter.stl", "-D 'diameter=30' -D 'height=4'" )
end

