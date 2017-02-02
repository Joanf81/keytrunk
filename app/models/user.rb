class User < ApplicationRecord
  def authenticate(pass)
    if self.pass == pass
      true
    else
      false
    end
  end
end
