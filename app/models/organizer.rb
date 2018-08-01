class Organizer<ApplicationRecord
    #setup association
    has_many :events, dependent: :destroy

    #downcase email before saving
    before_save {self.email = email.downcase}

    #validations
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 30}
    #email Regular Expression
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
    
    #for bcrypt password digest
    has_secure_password
end