# config/environments/production.rb
config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => {
    :bucket => ENV['cclaiborne'],
    :access_key_id => ENV['AKIAITERNCTEJJDBDTTQ'],
    :secret_access_key => ENV['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']
  }
}
