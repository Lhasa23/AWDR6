require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test 'product price must be positive' do
    product = Product.new(title: 'new product 1',
                          description: '123123',
                          image_url: 'https://1.png')
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 product.errors[:price]
    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: 'My Book Title',
                description: '12312313',
                price: 1,
                image_url: image_url)
  end

  test 'image url' do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
           http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"
    end
    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test 'product is not valid without a unique title' do
    product = Product.new(title: products(:ruby).title,
                          description: products(:two).description,
                          price: 1,
                          image_url: 'fred.gif')
    assert product.invalid?
    assert_equal ['has already been taken'], product.errors[:title]
  end

  test 'product is not valid without a unique title -i18n' do
    product = Product.new(title: products(:ruby).title,
                          description: products(:two).description,
                          price: 1,
                          image_url: 'fred.gif')
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end

  test 'product title length must be greater than or equal 10' do
    product = Product.new(title: 'nba',
                          description: 'are you ok',
                          price: 1,
                          image_url: 'https://1.png')
    assert product.invalid?
    assert_equal ['title length must be greater than or equal 10'], product.errors[:title]

    product.title = ''
    assert product.invalid?
    assert_equal ["can't be blank"], product.errors[:title]
  end
end