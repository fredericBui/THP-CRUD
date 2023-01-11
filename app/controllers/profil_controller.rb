class ProfilController < ApplicationController
    def index
        @user = User.find_by(name: params[:user])
    end
end
