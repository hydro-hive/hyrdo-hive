def create_output_dir
  Dir.mkdir 'out' unless File.exists?('out')
end

def openscad_command
  if RUBY_PLATFORM.include? 'darwin'
    return '/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'
  end
  'openscad'
end


desc 'germination hive'
task :germination_hive do
  create_output_dir
  puts "Generating stl for germination pod"
  exec_command = "#{openscad_command} -D 'height=60' -D 'width=2' -D 'diameter=60' -o out/germination-pod.stl main.scad"
  system exec_command
end
