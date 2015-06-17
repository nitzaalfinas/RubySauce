module Adm::TemplatesHelper
  
  def read_json(template)
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+template.name+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+template.name+'/template.json')
      datax = JSON.parse(data_json)
      "<div>Name: "+datax['name']+"</div>
      <div>Version: "+datax['template_version']+"</div>
      <div>Author: "+datax['author']+"</div>
      <div>URL: "+datax['url']+"</div>
      <div>Email: "+datax['email']+"</div>
      <div>License: "+datax['license']+"</div>
      <div>Description: "+datax['description']+"</div>"
    else
      ""
    end
  end
  
  
end
