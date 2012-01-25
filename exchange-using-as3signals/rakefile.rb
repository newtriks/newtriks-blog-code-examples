require 'rubygems'
require 'bundler'
Bundler.require

##############################
# Configure

def configure_mxmlc t
  t.default_size = "450,90"
  t.library_path << 'lib/robotlegs/robotlegs-framework-v1.5.2.swc'
  t.library_path << 'lib/as3-signals-v0.9-BETA.swc'
  t.source_path  << "lib/robotlegs"
end

##############################
# Debug

# Compile the debug swf
mxmlc "bin/swf/RobotLegs_Mediator_Example-debug.swf" do |t|
  configure_mxmlc t
  t.input = "src/Exchange.as"
  t.debug = true
end

desc "Compile and run the debug swf"
flashplayer :debug => "bin/swf/Exchange-debug.swf"

##############################
# Test

library :asunit4

# Compile the test swf
mxmlc "bin/test/Exchange-test.swf" => :asunit4 do |t|
  configure_mxmlc t
  t.input = "test/ASUnit4Runner.as"
  t.library_path << "lib/asunit4/AsUnit-4.2.3.pre.swc"
  t.library_path << "lib/asunit4/mockolate-0.11.0-as3.swc"
  t.library_path << "lib/asunit4/hamcrest-as3-only-1.1.3.swc"
  t.source_path << "src"
  t.source_path << "test"
  t.default_size = "975,600"
  t.debug = true
end

desc "Compile and run the test swf"
flashplayer :test => "bin/test/Exchange-test.swf"

task :default => :debug
