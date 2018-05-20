class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]



  NEWS_PER_PAGE=3
  # GET /comments
  # GET /comments.json
  def index
    # @comments = Comment.all
    @comments = Comment.order(:id).limit(NEWS_PER_PAGE) 
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
     @comment = Comment.find(params[:id])
     @user = @comment.find(params[:comment_id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    
    if logged_in?
      @news = News.find_by(params[:id])
      @comment = @news.comments.build(comment_params)
      @comment.user = current_user
    
      respond_to do |format|
        if @comment.save
          flash[:success] = "Successful commented"
          format.html { redirect_to @news}
          format.json { render :show, status: :created, location: @comment }
        else
          flash[:success] = "Input is too long or short"
          format.html { redirect_to @news }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = "Please log in first"
      redirect_to login_path
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /comments/1
  # # DELETE /comments/1.json
  # def destroy
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
    
    
end
