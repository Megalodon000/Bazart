class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all
    end

    def show
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)

        if @list.save!
            flash[:success] = "List Created Successfully"
            redirect_to "/lists/#{list.id}"
        else
            flash[:warning] = "List Not Created"
            redirect_to "/lists/new"
        end
    end

    def edit
        @list = List.find(params[:id])
    end

    def destroy
        @list = List.destroy
        redirect_to "/lists"
    end

    def update
    end

    private

    def set_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:title, :description)
    end
end
