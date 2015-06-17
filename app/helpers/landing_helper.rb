module LandingHelper
  def show_excerp(article)
    if article.excerp != "" || article.excerp.nil?
      article.excerp+' <a href="/'+article.permalink+'">[Read more ...]</a>'
    else
      strip_tags(article.body)[0..400]+' <a href="/'+article.permalink+'">[Read more ...]</a>'
    end
  end
end
