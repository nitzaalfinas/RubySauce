module ApplicationHelper
  $page_menus = VPage.where("publish_status = 'Publish'")
end
