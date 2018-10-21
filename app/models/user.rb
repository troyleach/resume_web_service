class User < ApplicationRecord
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
