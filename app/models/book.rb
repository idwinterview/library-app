class Book < ActiveRecord::Base
  belongs_to :customer

  def initialize
    @state = "In Stock"
  end

  def check
    case @state
    when "In Stock"
      @state = "Checked Out"
    when "Checked Out"
      @state = "In Stock"
    else
      "Invalid Action"
    end
  end

  def lost
    case @state
    when "In Stock" || "Checked Out"
      @state = "Lost"
    else
      "Invalid Action"
    end
  end

end
