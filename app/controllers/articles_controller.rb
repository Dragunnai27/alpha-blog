class ArticlesController < ApplicationController
    def index

    end
    # tạo một articles mới
    def new
        @article = Articles.new
    end

    # :articles là tên của model
    def create
        #render plain: params[:articles].inspect
        @article = Articles.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    # Tìm theo id để hiển thị    
    def show
        @article = Articles.find(params[:id])
    end

    #Hàm private cho phép truy cập title và description của :articles
    private
    def article_params
        params.require(:articles).permit(:title, :description)
    end

end
