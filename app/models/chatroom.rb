class Chatroom < ApplicationRecord
<<<<<<< HEAD
    has_many :messages
    
end

=======
    has_many :messages, dependent: :destroy
end
>>>>>>> e37754df70e9b768f1c8ce16fa7e90a53f6cb274
