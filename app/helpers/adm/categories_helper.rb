module Adm::CategoriesHelper
  
  def adm_categories_ordering(rows, of, q)     
    if(q == nil)
      q = ''
    end
    '
      <small class="pull-right">
        <a href="/adm/categories?page=1&rows='+rows.to_s+'&of='+of+'&od=desc&q='+q+'" class="order_head '+of+'_desc">
          <i class="glyphicon glyphicon-chevron-down"></i>
        </a>
        <a href="/adm/categories?page=1&rows='+rows.to_s+'&of='+of+'&od=asc&q='+q+'" class="order_head '+of+'_asc">
          <i class="glyphicon glyphicon-chevron-up"></i>
        </a>
      </small>
    '
  end
  
end
