class ArticlesController < ApplicationController

    http_basic_authenticate_with name: 'momo9', 
                                 password: 'abc',
                                 except: [:index, :show]

    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find params[:id]
    end

    def create
        @article = Article.new articleParams

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article = Article.find params[:id]
        @article.destroy

        redirect_to articles_path
    end

    def edit
        @article = Article.find params[:id]
    end

    def update
        @article = Article.find params[:id]

        if @article.update articleParams
            redirect_to @article
        else
            render 'edit'
        end
    end

    private
    def articleParams
        params.require(:article).permit(:title, :content)
    end
end
