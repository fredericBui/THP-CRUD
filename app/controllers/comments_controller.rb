class CommentsController < ApplicationController
    def create
        @gossip = Gossip.find(params[:id])
        @comment = Comment.create( 
            content: params[:content], 
            user: User.last(), 
            gossip: @gossip
        )
    
        if @comment.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])

        if @comment.update(comment_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to root_path, status: :see_other
    end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end
