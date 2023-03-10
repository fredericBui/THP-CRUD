class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
        @comments = @gossip.comments
    end

    def new
        @gossip = Gossip.new
        @tags = Tag.all
    end

    def create
        @gossip = Gossip.create(gossip_params )
        @gossip.user = User.last()
        @gossip.tag = Tag.find(params[:tag])
    
        if @gossip.save
          redirect_to @gossip
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @gossip = Gossip.find(params[:id])
        @tags = Tag.all
    end

    def update
        @gossip = Gossip.find(params[:id])
        @gossip.tag = Tag.find(params[:tag])

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
            params.require(:gossip).permit(:title, :content, :tag)
        end
end
