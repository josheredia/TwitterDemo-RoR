class TweetsController < ApplicationController
  # GET /tweets
  def index
    # @tweets = Tweet.all
    @tweets = Tweet.all.sort { |x, y| y[:created_at] <=> x[:created_at] }
  end

  # GET /tweets/:id
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/:id/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/:id
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.user = current_user

    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  # DELETE /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
