require 'albacore'

namespace :build do
  desc 'compiles the library project'
  csc :compile => :init do|csc| 
    csc.compile FileList["source/**/*.cs"].exclude("AssemblyInfo.cs")
    csc.references configatron.all_references
    csc.output = File.join(configatron.artifacts_dir,"#{configatron.project}.specs.dll")
    csc.target = :library
  end

  desc 'compiles the web project'
  aspnetcompiler :web => [:init, :copy_config_files] do |c|
    c.physical_path = "source/app.web.ui"
    c.target_path = configatron.web_staging_dir
    c.updateable = true
    c.force = true
  end

  task :rebuild => ["clean","compile"]

  desc 'run the web application'
  task :run => [:kill_iis,'build:web'] do
    system("start start_web_app.bat")
    system("start #{configatron.browser} #{configatron.start_url}")
  end
end
