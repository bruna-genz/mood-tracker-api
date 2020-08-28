if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api', domain: '.herokuapp.com', secure: true, same_site: :none
else
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api' 
end