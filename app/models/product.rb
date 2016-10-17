class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    quantity == 0
  end

  def validations
    errors.add(:name, "Name must not be nil")
    errors.add(:price, "Price must not be nil")
    errors.add(:quantity, "Quantity must not be nil")
    errors.add(:category, "Category must be defined")
  end

end
