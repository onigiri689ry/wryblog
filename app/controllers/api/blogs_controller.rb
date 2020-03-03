class Api::BlogsController < ApplicationController

  def image_destroy
    image = Image.find(params[:img_id])
    if image.product.seller_id == current_user.id
      image.destroy
    end
  end
end