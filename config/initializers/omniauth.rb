Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client, Rails.application.secrets.google_secret,
    {
      name: 'google',
      scope: 'email',
      image_aspect_ratio: 'square'
    }
end
