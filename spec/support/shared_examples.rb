shared_examples :book do |factory_hash|
  factory_name = factory_hash[:using_factory]

  it "- #{factory_name} has a customer" do
    object = create(factory_hash[:using_factory])
    customer = create(:customer)

    object.customer = customer

    expect(object.customer).to eql(customer)
  end

  context '#status' do
    it "delegates to its customer_book" do
      customer = create(:customer)
      book = create(:book)

      customer.books << book

      expect(book.status).to eql(book.customer_book.status)
    end
  end

  context '#checked_out?' do
    it 'is checked out if status is checked out' do
      book = create(:book)

      allow(book).to receive(:status).and_return('checked out')

      expect(book.checked_out?).to be_truthy
    end

    it 'is not checked out if it has no customer_book' do
      book = create(:book)

      expect(book.customer_book).to be_nil
      expect(book.checked_out?).to be_falsey
    end
  end

  context '#check_in' do
    it 'can be checked in' do
      book = create(:book)
      customer = create(:customer)
      customer.books << book

      expect(book.checked_out?).to be_truthy

      book.check_in

      expect(book.checked_out?).to be_falsey
      expect(book.customer_book.status).to eql('returned')
    end
  end
end
