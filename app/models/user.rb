class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  has_many :competences, through: :user_competences

  has_attached_file :avatar,
    styles: {
      medium: '300x300>',
      thumb: '100x100>'
    },
    default_url: '/images/:style/missing.png',
    path: ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment :avatar,
    size: {
      less_than: 5.megabytes
    }

  ROLES = %w[admin moderator author banned].freeze

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def is?(role)
    ROLES.include?(role.to_s)
  end

  def self.authenticate(creds)
    # creds Hash should contain email and password keys
    # Let's check we have eveything
    if !creds['login'] or !creds['password']
      Ramaze::Log.info("Login failure : no credentials")
      return false
    end

    # Ok, get the matching user from the database
    user = self[login: creds['login']]

    # No user ? Bail out.
    if user.nil? 
      Ramaze::Log.info("Login failure : wrong password")
      return false
    end

    # Real authentication stuff is here
    # This uses the #password method above
    # and Bcrypt::Password#== method for comparison
    if user.password == creds['password']
      Ramaze::Log.info("Login success for %s" % user.email)
      return user
    end
  end
end
