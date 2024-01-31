class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all
    end

    def show
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)

        if @review.save!
            flash[:success] = "Review Created Successfully"
            redirect_to "/reviews/#{review.id}"
        else
            flash[:warning] = "Review Not Created"
            redirect_to "/reviews/new"
        end
    end

    def edit
        if @review.update(review_params)
            flash[:success] = "Review Updated Successfully"
            redirect_to "/reviews/#{review.id}"
        else
            flash[:warning] = "Review Not Updated"
            redirect_to "/reviews/#{review.id}/edit"
        end
    end

    def destroy
        @review.destroy
        redirect_to "/reviews"
    end

    private

    def set_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :description)
    end
end
