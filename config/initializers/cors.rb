Rails.application.config.middleware.insert_before 0, Rack::Cors do 
  allow do
    origins 'https://ohmymood.netlify.app/'
  
    resource '*',
      headers: 'Access-Control-Allow-Origin',
      methods: [:get, :post, :delete],
      credentials: true
  end
end