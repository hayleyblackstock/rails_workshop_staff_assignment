class Person < ActiveRecord::Base

def full_name
"#{title} #{first_name} #{last_name}"
end

validates :first_name && :last_name, presence: true || :title && :last_name, presence: true

end
