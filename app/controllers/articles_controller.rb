class ArticlesController < ApplicationController
    def index
        @list_articles = Articles.all
    end
    # tạo một articles mới
    def new
        @article = Articles.new
    end

    def edit
        @article = Articles.find(params[:id])
    end

    # :articles là tên của model
    def create
        #render plain: params[:articles].inspect
        @article = Articles.new(article_params)
        if @article.save
            #Hiện thông báo
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            #reload lại trang 
            render 'new'
        end
    end

    # Tìm và cập nhật bài viết
    def update
        @article = Articles.find(params[:id])
        if @article.update(article_params)
            #Hiện thông báo
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            #reload lại trang 
            render 'edit'
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
