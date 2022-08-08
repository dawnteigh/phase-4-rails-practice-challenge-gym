class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    render json: Client.find(params[:id]), status: :ok
  end

  private

  def not_found
  render json: { error: "Client not found" }, status: :not_found
  end
end
