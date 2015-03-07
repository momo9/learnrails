class ArticlesController < ApplicationController
    def new
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find params[:id]
    end

    def create
        @article = Article.new articleParams

        @article.save
        redirect_to @article
    end

    def destroy
        @article = Article.find params[:id]
        @article.destroy

        redirect_to articles_path
    end

    private
    def articleParams
        params.require(:article).permit(:title, :content)
    end
end
