require 'fileutils'

output_dir = 'out'

task :output_dir do
  Dir.mkdir output_dir unless File.exists?(output_dir)
end

desc "clean everything"
task :clean do
    FileUtils.rm_rf(output_dir)
end

def openscad_command
  if RUBY_PLATFORM.include? 'darwin'
    return '/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'
  end
  'openscad'
end

def openscad(scad, stl, argument_list) 
    args = ""
    argument_list.each do |key, value|
        args = "#{args}-D '#{key}=#{value}' "
    end
    puts ">> Generate #{stl} from #{scad}"
    sh "#{openscad_command} #{args} -o out/#{stl} #{scad}"
end



desc 'germination hive'
task :germination_hive => :output_dir do
  openscad( 
           "main.scad", 
           "germination-pod.stl", 
           {
               'height'     => 60,
               'width'      => 2,
               'diameter'   => 60,
           })
end

desc 'create a more complex version'
task :complex_version => :output_dir do
    bottle_height   = 80
    bottle_diameter = 80
    filter_diameter = 50
    filter_height   = 8
    nossle_diameter = 5
    nossle_height   = 10
   openscad( 
            "make_filter.scad", 
            "complex_filter.stl", 
            { 
                'diameter'  => filter_diameter, 
                'height'    => filter_height,
            })
   openscad( 
            "make_bottle.scad", 
            "complex_bottle.stl", 
            {
                'diameter'          => bottle_diameter,
                'height'            => bottle_height,
                'filter_diameter'   => filter_diameter,
                'filter_height'     => filter_height,
                'nossle_diameter'   => nossle_diameter,
                'nossle_height'     => nossle_height,
            })
end

