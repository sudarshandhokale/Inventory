# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # config.secret_key = 'd2b4760fc40186a640f54dc0b88bf1d0ba238666c89bbdd4debd8a855ee2ebd81a46354d4d584376e31fc777dbf17e51ae786ff9b7b6cf5ece68e87fdbc7bd5b'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  require 'devise/orm/active_record'
  # config.authentication_keys = [ :email ]
  # config.request_keys = []
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  # config.clean_up_csrf_token_on_authentication = true
  config.stretches = Rails.env.test? ? 1 : 10
  # config.pepper = 'fba3ff9189a45bdd702584586a4026d2d90a4b60f91b26aa86f60af79d2cc5837f987875d0a3246a191f2e3c80ebb22080c9e82becfe48b7e8c4892496ebe876'
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true
  # config.confirmation_keys = [ :email ]
  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}
  config.password_length = 8..128
  # config.email_regexp = /\A[^@]+@[^@]+\z/
  # config.timeout_in = 30.minutes
  # config.expire_auth_token_on_timeout = false
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [ :email ]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true
  # config.reset_password_keys = [ :email ]
  config.reset_password_within = 6.hours
  # config.encryptor = :sha512
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true
  # config.navigational_formats = ['*/*', :html]
  config.sign_out_via = :delete
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end
  # config.router_name = :my_engine
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
