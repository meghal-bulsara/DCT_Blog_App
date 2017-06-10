3.times do
  category = Category.new
  category.name = Faker::Commerce.department
  category.save
end

10.times do
  article = Article.new
  article.title = Faker::Lorem.sentence
  article.body = Faker::Lorem.paragraph
  category = Category.all.sample
  article.category_id = category.id
  article.publish_date = Faker::Date.between(Date.today,7.days.from_now)
  article.save
end


articles = Article.all
articles.each do |article|
  5.times do
    comment = Comment.new
    comment.title = Faker::Lorem.sentence
    comment.body = Faker::Lorem.paragraph
    comment.article_id = article.id
    comment.save
  end
end
