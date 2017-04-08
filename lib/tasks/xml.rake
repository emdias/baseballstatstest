namespace :xml do

  desc 'Upload and parse a n XML file from the internet'
  task :upload_xml, [:xml_path] => :environment do |t, args|
    XmlService.upload_xml(args[:xml_path])
  end

  desc 'Load and parse a n XML file from a local source'
  task :read_xml, [:xml_path] => :environment do |t, args|
    XmlService.read_xml(args[:xml_path])
  end

end