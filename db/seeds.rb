# require_relative './config/environment'

5.times do 
Category.create(:name => Faker::Lorem.words(1)[0])
end

30.times do
  Post.create(:title => Faker::Lorem.words(1)[0],
              :category_id => rand(5)+ 1,
              :price => (10..100).to_a.sample.to_s,
              :description => Faker::Lorem.sentences(3).join(" "),
              :email =>  Faker::Internet.email,
              :edit_key => (("A".."Z").to_a+(0..9).to_a).sample(6).join)
end
