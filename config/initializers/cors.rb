Rails.application.config.middleware.insert_before 0, Rack::Cors do 
  allow do
    origins 'http://localhost:3000'
  
    resource '*',
      headers: :any,
      methods: [:get, :post, :delete],
      credentials: true
  end

  allow do
    origins 'https://ohmymood.herokuapp.com'
  
    resource '*',
      headers: :any,
      methods: [:get, :post, :delete],
      credentials: true
  end
end