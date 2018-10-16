class Articles < ApplicationRecord
    # Kiểm tra title phải đã được nhập chưa, độ dài của title
    validates :title, presence: true, length: {minimum: 5, maximum: 50}
    # Kiểm tra description phải đã được nhập chưa, độ dài của description
    validates :description, presence: true, length: {minimum: 10, maximum: 300} 
end
