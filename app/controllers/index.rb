get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/new' do
  erb :new
end

get '/:word' do
@word = params[:word]
@category = Category.find_by_name(@word).id
@posts = Post.find_all_by_category_id(@category)
erb :post
end

get '/:word/:word2' do
@word2 = params[:word2]
@description = Post.find_by_title(@word2).description
@email = Post.find_by_title(@word2).email
@price = Post.find_by_title(@word2).price
@title = Post.find_by_title(@word2).title
erb :item
end

post '/new-post' do
@category_id = Category.find_by_name(params[:category]).id

@edit_key = (("A".."Z").to_a+(0..9).to_a).sample(6).join

Post.create(:title => params[:title].gsub(/\s+/, ""), 
            :description => params[:description], 
            :price => params[:price], 
            :email => params[:email], 
            :category_id => @category_id,
            :edit_key => @edit_key) 

redirect '/'
end

get '/edit/:key' do

@edit_key = params[:key]
erb :edit
end
