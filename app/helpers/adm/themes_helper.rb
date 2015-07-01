module Adm::ThemesHelper
  
  def read_json(theme)
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+theme.folder_name+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+theme.folder_name+'/theme.json')
      datax = JSON.parse(data_json)
      "<div>Name: "+datax['name']+"</div>
      <div>Version: "+datax['theme_version']+"</div>
      <div>Tags: "+datax['tags']+"</div>
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
