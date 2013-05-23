OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "159071227604238", "703674ccd5c1fb1266785fa59a534c01"
  provider :twitter, "bBTo9AH9P2kg0RYBgUNg", "QMqewWV7Yqt5evXdSCtHG09nS6nbjfPf6xEZLoQeooo"
end