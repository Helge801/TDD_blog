def em string
  puts "*" * 100
  puts "   " + string
  puts "*" * 100
end

def random_quote
  case [*1..6].sample
  when 1 then Faker::HitchhikersGuideToTheGalaxy.quote
  when 2 then Faker::HeyArnold.quote
  when 3 then Faker::HowIMetYourMother.quote
  when 4 then Faker::Movie.quote
  when 5 then Faker::Seinfeld.quote
  else
    Faker::Dune.quote
  end
end

def get_long_content quotes
  content = ""
  quotes.times do
    content += (random_quote + " ")
  end
  content
end

em "creating Blogs"
@count = 0
20.times do |i|
  blog = Blog.create!(title: Faker::Book.title,
               description: get_long_content(9),
               image:Faker::LoremPixel.image("600x300")
              )
  @count += 1
  puts "#{blog.id}: #{blog.title}"
end
em "#{@count} blogs created"