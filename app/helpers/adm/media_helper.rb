module Adm::MediaHelper
  
  def show_image(image_file_name)
    if(File.exists?(Rails.root.to_s+'/public/images/thumb/'+image_file_name))
      image_tag('thumb/'+med.med_storage_name, alt: med.med_alt, style: "margin-bottom: 10px; max-width: 250px;")
    else
      image_tag('thumb/default.png', style: "margin-bottom: 10px; max-width: 250px;")
    end
  end
end
