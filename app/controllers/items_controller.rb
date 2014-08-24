class ItemsController < ApplicationController
  def create
    item = Item.new item_params
    item.user = current_user

    respond_to do |format|
      if item.save
        format.html { redirect_to root_path }
        format.json { render json: { files: [item.to_jq_upload]}, status: :created, location: root_path }
      else
        format.html { redirect_to root_path }
        format.json { render json: item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit :document
  end
end
