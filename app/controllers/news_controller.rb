require 'uri'



class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_filter :set_page, only: [:index]
  before_filter :set_title
  
  NEWS_PER_PAGE=8
  # GET /news
  # GET /news.json
  def index
    @news = News.order(:id).limit(NEWS_PER_PAGE).offset(@page * NEWS_PER_PAGE) 
    # @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])
    @comments = @news.comments
  end

  # GET /news/new
  def new
    if logged_in?
      @news = News.new
    else
      flash[:success] = "Please log in first"
      redirect_to login_path
    end
  end

  # GET /news/1/edit
  def edit
  end
  
  # def next
  #   page = params[:page]
  #   params[:page] += 1
  #   @news = news.find_news_on_page(page, NEWS_PER_PAGE)
  #   render :new
  # end
  # POST /news
  # POST /news.json
  def create
    @news = current_user.news.new(news_params)

    respond_to do |format|
      if @news.save
         flash[:success] = "Successfully posted"
        format.html { redirect_to @news }
        format.json { render :show, status: :created, location: @news }
      else
         flash[:success] = "Something goes wrong"
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  # def update
  #   respond_to do |format|
  #     if @news.update(news_params)
  #       format.html { redirect_to @news, notice: 'News was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @news }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @news.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /news/1
  # DELETE /news/1.json
  # def destroy
  #   @news.destroy
  #   respond_to do |format|
  #     format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :url)
    end
    
    def set_page
       @page = params[:page].to_i || 0
    end
    
    def set_title
      @page_title = "Home Page #" + @page.to_s
    end
end
