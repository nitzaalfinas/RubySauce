module LandingHelper
  def show_excerp(article)
    if article.excerp != "" || article.excerp.nil?
      article.excerp
    else
      strip_tags(article.body)[0..255]
    end
  end
end
