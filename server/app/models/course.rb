class Course < ApplicationRecord

    validates :school_id, presence: true
    validates :section, presence: true, length: { minimum: 1 }
    validates :starting_time, presence: true
    validates :ending_time, presence: true
end
