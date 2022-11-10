module Secure::Token
  module_function

  def generete_for(register)
    klass = register.class

    token = SecureRandom.urlsafe_base64

    while klass.where(token: token).exists?
      token = SecureRandom.urlsafe_base64
    end

    token
  end
end