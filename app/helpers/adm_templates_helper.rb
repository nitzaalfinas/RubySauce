module AdmTemplatesHelper
  
  def read_json(template)
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+template.name+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+template.name+'/template.json')
      datax = JSON.parse(data_json)
      "<div>Name: "+datax['name']+"</div>
      <div>Author: "+datax['author']+"</div>
      <div>Email: "+datax['email']+"</div>
      <div>About: "+datax['about']+"</div>"
    else
      ""
    end
  end
  
end
