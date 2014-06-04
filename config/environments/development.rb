Polla2014::Application.configure do
  CONFIG = YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env]
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  config.i18n.available_locales = ['es-CO', :en]
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings =  {
      :address              => CONFIG['mail_address'],
      :port                 => 25,
      :user_name            => CONFIG['mail_username'],
      :password             => CONFIG['mail_password'],
      :authentication       => :cram_md5,
      :enable_starttls_auto => true,
      :openssl_verify_mode  => 'none'
    }
    
    
    
  
end
