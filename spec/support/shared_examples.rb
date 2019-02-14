shared_examples :book do |factory_hash|
  factory_name = factory_hash[:using_factory]

  it "- #{factory_name} has a customer" do
    object = create(factory_hash[:using_factory])
    customer = create(:customer)

    object.customer = customer

    expect(object.customer).to eql(customer)
  end
end
