class ArticlesController < ApplicationController
   before_action :set_articles, only: [:edit, :update, :show, :destroy]
    # gọi ra hàm set_articles trước và chỉ gọi ở 4 hàm edit,update,show,destroy

    # xuất ra danh sách của bài viết
    def index
        @list_articles = Articles.all
    end

    # tạo một articles mới
    def new
        @article = Articles.new
    end

    # chỉnh sửa bài viết
    def edit
       #set_articles
    end

    # :articles là tên của model
    def create
        #render plain: params[:articles].inspect
        @article = Articles.new(article_params)
        if @article.save
            #Hiện thông báo
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            #reload lại trang 
            render 'new'
        end
    end

    # Tìm và cập nhật bài viết
    def update
        #set_articles
        if @article.update(article_params)
            #Hiện thông báo
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            #reload lại trang 
            render 'edit'
        end
    end
    

    # Tìm theo id để hiển thị    
    def show
        #set_articles
    end

    # xóa bài viết
    def destroy
        #set_articles
        @article.destroy
        flash[:danger] = "Article was successfully deletetd"
        redirect_to articles_path
    end

    #Hàm private cho phép truy cập title và description của :articles
    private
    def set_articles
        @article = Articles.find(params[:id])
    end

    def article_params
        params.require(:articles).permit(:title, :description)
    end

end
