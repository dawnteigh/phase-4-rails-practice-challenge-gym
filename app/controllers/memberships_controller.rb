class MembershipsController < ApplicationController

    def create
        client = Client.find_by(id: params[:client_id])
        membership = client.memberships.build(membership_params)
        if membership.save
            render json: membership, status: :created
        else
            render json: { error: membership.errors.full_messages }, status: :unprocessable_entity
        end
    end



    private

    def membership_params
        params.permit(:client_id, :gym_id, :charge)
    end
end
