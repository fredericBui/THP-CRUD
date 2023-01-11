class GossipController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossip = Gossip.find(params[:id])
    
        if @gossip.update(gossip_params)
          redirect_to @gossip
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    private
        def gossip_params
            params.require(:gossip).permit(:title, :body)
        end
end
