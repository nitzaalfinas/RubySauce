module Adm::MediaHelper
  
  def show_image(image_file_name)
    if(File.exists?(Rails.root.to_s+'/public/images/thumb/'+image_file_name))
      image_tag('thumb/'+image_file_name, alt: image_file_name, style: "margin-bottom: 10px; max-width: 250px;")
    else
      image_tag('thumb/default.png', style: "margin-bottom: 10px; max-width: 250px;")
    end
  end
end
