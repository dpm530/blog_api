class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]


   def index
      render json: serializer.new(Article.all)
   end


   def show
      render json: serializer.new(Article.find(params[:id]))
   end

   def create
      @article = Article.new(article_params)

      if @article.save
         render json: { status: "Success", message:"Article created.", data: @article }, status: :ok
      else
         render json: { status: "Error", message:"Article not created.", data:@article },status: :unprocessable_entity
      end
   end


   def update
      if @article.update(article_params)
         render json: { status: "Success", message:"Article updated.", data: @article }, status: :ok
      else
         render json: { status: "Error", message:"Article not updated.", data:@article },status: :unprocessable_entity
      end
   end


   def destroy
      @article.destroy
      render json: { status: 'Success', message: "Article deleted.", data: @article}, status: :ok
   end

   private

      
      def set_article
         @article = Article.find(params[:id])
      end


      def article_params
         params.require(:article).permit(:title, :content, :slug)
      end

      def serializer
         ArticleSerializer
      end


end
