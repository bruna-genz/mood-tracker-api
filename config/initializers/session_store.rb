if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api', secure: true, same_site: :none
else
  Rails.application.config.session_store :cookie_store, key: '_mood-tracker-api' 
end