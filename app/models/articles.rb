class Articles < ApplicationRecord
    # Kiểm tra title phải đã được nhập chưa
    validates :title, presence: true, length: {minimum: 5, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300} 
end
