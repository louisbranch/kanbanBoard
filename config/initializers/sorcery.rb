Rails.application.config.sorcery.submodules = [:remember_me, :reset_password]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  # -- core --
  config.not_authenticated_action = :not_authenticated              # what controller action to call for
                                                                      # non-authenticated users.
                                                                      # You can also override 'not_authenticated'
                                                                      # instead.

  config.save_return_to_url = true                                    # when a non logged in user tries to enter
                                                                      # a page that requires login,
                                                                      # save the URL he wanted to reach,
                                                                      # and send him there after login, using
                                                                      # 'redirect_back_or_to'.
  # --- user config ---
  config.user_config do |user|
    # -- core --
    user.username_attribute_names = [:email]                                          # specify username
                                                                                      # attributes, for example:
                                                                                      # [:username, :email].

    user.encryption_algorithm = :bcrypt                                               # encryption algorithm name. See
                                                                                      # 'encryption_algorithm=' for
                                                                                      # available options.

    # -- reset_password --
    user.reset_password_token_attribute_name = :reset_password_token                          # reset password code
                                                                                                # attribute name.

    user.reset_password_token_expires_at_attribute_name = :reset_password_token_expires_at    # expires at attribute
                                                                                                # name.

    user.reset_password_email_sent_at_attribute_name = :reset_password_email_sent_at          # when was email sent,
                                                                                                # used for hammering
                                                                                                # protection.

    user.reset_password_mailer = UserMailer                                                          # mailer class. Needed.

    user.reset_password_email_method_name = :reset_password_email                             # reset password email
                                                                                                # method on your mailer
                                                                                                # class.

    user.reset_password_expiration_period = nil                                               # how many seconds
                                                                                                # before the reset
                                                                                                # request expires. nil
                                                                                                # for never expires.

    user.reset_password_time_between_emails = 5 * 60                                          # hammering protection,
                                                                                                # how long to wait
                                                                                                # before allowing
                                                                                                # another email to be
                                                                                                # sent.
  end

  # This line must come after the 'user config' block.
  config.user_class = "User"                                       # define which model authenticates
                                                                                      # with sorcery.
end
