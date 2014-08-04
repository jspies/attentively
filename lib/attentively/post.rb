class Post
  def request
    Request.new(uri: 'posts')
  end
end