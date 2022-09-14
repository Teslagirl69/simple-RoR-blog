json.array! @articles do |article|
  json.title article.title
  json.text article.text
   json.user do
     json.id article.user.id
     json.name article.user.username
  end
   json.comments article.comments, :body, :author
end