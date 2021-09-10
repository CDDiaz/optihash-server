if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_optihash', domain: 'https://optihash.herokuapp.com' # XZE
else
  Rails.application.config.session_store :cookie_store, key: '_optihash'
end
