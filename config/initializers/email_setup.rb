if Rails.env.staging? || Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :user_name => ENV['GMAIL_USERNAME'],
    :password => ENV['GMAIL_PASSWORD'],
    :domain => 'gmail.com',
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain, # plain?login
    :enable_starttls_auto => true
  }
end
