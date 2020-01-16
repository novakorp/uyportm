module ApplicationHelper 
  
  # funcion auxiliar para generar ids de paginas para jquery mobile
  def mobile_page_id(path = request.path)
    # path.sub(/\A\/mobile\//,'').gsub("/",'_')
    path.gsub("/",'_')
  end
    
  def mobile_item_id(item_url)
    'item' + item_url.gsub('/','_')
  end
  
end 
