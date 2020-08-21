if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api', domain: 'https://ohmymood.herokuapp.com/'
else
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api' 
end