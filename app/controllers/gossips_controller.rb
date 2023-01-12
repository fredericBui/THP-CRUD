class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
        @comments = @gossip.comments
    end

    # def new
    #     @gossip = Gossip.new
    # end

    # def create
    #     @gossip = Gossip.new(title: "test", content: "test", user: User.last())
    
    #     if @gossip.save
    #       redirect_to @gossip
    #     else
    #       render :new, status: :unprocessable_entity
    #     end
    # end

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

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy

        redirect_to root_path, status: :see_other
    end
    
    private
        def gossip_params
            params.require(:gossip).permit(:title, :content)
        end
end
