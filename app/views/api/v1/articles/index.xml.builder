xml.rss('version' => '2.0') do
  xml.title('List of articles:')
  @articles.each do |article|
    xml.article do
      xml.name article.title
      xml.tag!('article:text', article[:text])
  #     xml.user do
  #       xml.id article.user.id
  #       xml.name article.user.username
  # end
  #     xml.comments article.comments, :body, :author
  #   end
  end
  end
end