require 'rails_helper'

describe BooksController do
  context "#list" do
    it 'renders the correct template' do
      customer = create(:customer)

      get :list, customer_id: customer.id

      expect(response).to render_template(:list)
    end

    it 'assigns customer' do
      customer = create(:customer)

      get :list, customer_id: customer.id

      expect(assigns(:customer).is_a? Customer).to be_truthy
    end

    it 'assigns customer books' do
      customer = create(:customer)
      book = create(:book)
      create(:customer_book, customer_id: customer.id, bookable_id: book.id)

      get :list, id: book.id, customer_id: customer.id

      result = assigns(:customer_books).all? { |cb| cb.is_a? CustomerBook }
      expect(result).to be_truthy
    end
  end

  context "#returned" do
    context "when the customer successfully returns a book" do
      it 'marks the book as returned' do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, bookable_id: book.id, status: "checked out")

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        customer_book.reload

        expect(customer_book.status).to eql('returned')
      end

      it 'displays a success flash message' do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, bookable_id: book.id, status: "checked out")

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        expect(flash[:success]).to eql("Book has been marked as returned.")
      end
    end
  end

  context "when the customer unsuccessfully returns a book" do
    it 'does not mark the book as returned' do
      customer = create(:customer)
      book = create(:book)
      customer_book = create(:customer_book, customer_id: customer.id, bookable_id: book.id, status: "checked out")

      allow_any_instance_of(CustomerBook).to receive(:save).and_return(false)

      request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
      post :returned, id: book.id, customer_id: customer.id

      customer_book.reload

      expect(customer_book.status).to_not eql("returned")
    end

    it 'displays the correct error flash message' do
      customer = create(:customer)
      book = create(:book)
      customer_book = create(:customer_book, customer_id: customer.id, bookable_id: book.id, status: "checked out")

      allow_any_instance_of(CustomerBook).to receive(:save).and_return(false)

      request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
      post :returned, id: book.id, customer_id: customer.id

      customer_book.reload

      expect(flash[:error]).to eql('Book could not be marked as returned.')
    end
  end

  it 'redirects correctly' do
    customer = create(:customer)
    book = create(:book)
    customer_book = create(:customer_book, customer_id: customer.id, bookable_id: book.id, status: "checked out")

    request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
    post :returned, id: book.id, customer_id: customer.id

    expect(response).to redirect_to(list_books_path(customer_id: customer.id))
  end
end
