class JsonPlaceHolderApi
  include HTTParty
  base_uri 'http://jsonplaceholder.typicode.com/'

  def initialize(body)
    @options = body
  end

  def new_post_to_posts_route
    self.class.post('/posts', @options)
  end
end
