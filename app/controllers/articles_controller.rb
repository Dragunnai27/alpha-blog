class ArticlesController < ApplicationController
    def index

    end
    def new
        @article = Articles.new
    end

    # :articles là tên của model
    def create
        #render plain: params[:articles].inspect
        @article = Articles.new(article_params)
        @article.save
        redirect_to articles_show(@article)
    end

    #Hàm private cho phép truy cập title và description của :articles
    private
    def article_params
        params.require(:articles).permit(:title, :description)
    end
end
