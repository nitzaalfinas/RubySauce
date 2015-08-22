module ArticlePageHelper
  
  def index_th_asc_desc(tender_status, rows, of, filters) 
    '
      <span>
        <a href="#" class="order_head '+of+'_desc">
          <i class="fa fa-caret-down"></i>
        </a>
        <a href="#" class="order_head '+of+'_asc">
          <i class="fa fa-caret-up"></i>
        </a>
      </span>
    '
  end
end
