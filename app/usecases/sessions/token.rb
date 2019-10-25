module Sessions
  class Token
    def self.encrypt(email)
      Digest::SHA256.hexdigest(email)
    end
  end
end