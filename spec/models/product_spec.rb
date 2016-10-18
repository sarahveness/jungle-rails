require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

      it 'should be a valid test' do
        newCategory = Category.create(id: 1, name: 'Apparel')
        hat = Product.create(name: 'hat', price: 50, quantity: 10, category_id: 1 )
        hat.update(:category_id => '1')
        expect(hat).to(be_valid)
      end

      it 'product should be saved to the db' do
        newCategory = Category.create(name: 'Apparel')
        pants = Product.create(name: 'pants', price: 50, quantity: 1, category_id: 1)
        pants.update(category_id: newCategory.id)
        expect(pants).to be_persisted
        expect(Category.count).to eql 1
    end


      it 'product should have a name' do
        newCategory = Category.create(name: 'Apparel')
        pants = Product.create(name: 'pants', price: 50, quantity: 1, category_id: 1)
        # pants.update(name: nil)
        expect(pants.name).to be_present
        # pants.errors[:name]
        pants.errors.full_messages
      end

      it 'should have a price' do
        newCategory = Category.create(name: 'Apparel')
        pants = Product.create(name: 'pants', price: 50, quantity: 1, category_id: 1)
        # pants.update(price: nil)
        expect(pants.price).to be_present
        # pants.errors[:price]
        pants.errors.full_messages
      end

      it 'should have a quantity' do
        newCategory = Category.create(name: 'Apparel')
        pants = Product.create(name: 'pants', price: 50, quantity: 1, category_id: 1)
        # pants.update(quantity: nil)
        expect(pants.quantity).to be_present
        # pants.errors[:quantity]
        pants.errors.full_messages
      end

      it 'should have a category' do
        newCategory = Category.create(name: 'Apparel')
        pants = Product.create(name: 'pants', price: 50, quantity: 1, category_id: 1)
        pants.update(category_id: newCategory.id)
        expect(pants.category).to be_present
        # pants.errors[:category]
        pants.errors.full_messages
      end

  end
end
