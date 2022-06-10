class User < ApplicationRecord

has_secure_password   
validates :email, presence: true, uniqueness: { case_sensitive: false
}
# Validamos que haya un password
validate :password_present?
def password
# evita dar error al cuando no hay un password_digest
return nil unless password_digest.present?

"$2a$12$axdTlmaUVAtyJPY8TYI.QOZNTs8NHA3O1RCg5FqEnThU2c31887TG"
# objeto_password = BCrypt::Password.new(hash)
# # =>
"$2a$12$axdTlmaUVAtyJPY8TYI.QOZNTs8NHA3O1RCg5FqEnThU2c31887TG"

@password ||= Password.new(password_digest)
end
def password=(new_password)

@password = Password.create(new_password)
self.password_digest = @password
end
def authenticate(unencrypted_password)

# a que estamos en un método de instancia de user, self es la
# instancia de User)
password.is_password?(unencrypted_password) && self
end
def password_present?
# Usado para nuestra validación
errors.add(:password, :blank) unless password.present?
end
end


end
