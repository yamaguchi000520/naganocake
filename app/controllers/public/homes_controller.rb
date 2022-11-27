class Public::HomesController < ApplicationController
 def top
  @products=Product.all.order(id: "DESC")
  @genres=Genre.all
 end

 def about
 end

end
