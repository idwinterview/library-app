require "rails_helper"

RSpec.describe BooksController do
  context "#list" do
    it "renders the correct template" do
      customer = create(:customer)

      get :list, customer_id: customer.id

      expect(response).to render_template(:list)
    end

    it "assigns customer" do
      customer = create(:customer)

      get :list, customer_id: customer.id

      expect(assigns(:customer)).to eq(customer)
    end

    it "assigns customer books" do
      customer = create(:customer)
      book = create(:book)
      create(:customer_book, customer_id: customer.id, book_id: book.id)

      get :list, id: book.id, customer_id: customer.id

      expect(assigns(:customer_books)).to eq(customer_books)
    end
  end

  context "#returned" do
    context "when the customer successfully returns a book" do
      it "marks the book as returned" do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, book_id: book.id, status: "checked out")

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        customer_book.reload

        expect(customer_book.status).to eq("returned")
      end

      it "displays a success flash message" do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, book_id: book.id, status: "checked out")

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        expect(flash[:success]).to eq("Book has been marked as returned.")
      end
    end

    context "when the customer unsuccessfully returns a book" do
      it "does not mark the book as returned" do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, book_id: book.id, status: "checked out")

        CustomerBook.any_instance.expects(:save).returns(false)

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        customer_book.reload

        expect(customer_book.status).to_not eq("returned")
      end

      it "displays the correct error flash message" do
        customer = create(:customer)
        book = create(:book)
        customer_book = create(:customer_book, customer_id: customer.id, book_id: book.id, status: "checked out")

        CustomerBook.any_instance.expects(:save).returns(false)

        request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
        post :returned, id: book.id, customer_id: customer.id

        customer_book.reload

        expect(flash[:error]).to eq("Book could not be marked as returned.")
      end
    end

    it "redirects correctly" do
      customer = create(:customer)
      book = create(:book)
      customer_book = create(:customer_book, customer_id: customer.id, book_id: book.id, status: "checked out")

      request.env["HTTP_REFERER"] = list_books_path(customer_id: customer.id)
      post :returned, id: book.id, customer_id: customer.id

      expect(response).to redirect_to(list_books_path(customer_id: customer.id))
    end
  end
end