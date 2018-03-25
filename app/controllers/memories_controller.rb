class MemoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :destroy]
  
  def index
  end
  
  def new
    @memory = Memory.new
  end
  
  #このアクションは、logを一覧表示させるもの
  def show
    @memory = Memory.find(params[:id])
    @logs = @memory.logs.order('created_at DESC').page(params[:page])
    @log = @memory.logs.build if @memory.user == current_user
  end
  
  def edit
    @memory = Memory.find(params[:id])
  end
  
  def create
    @memory = current_user.memories.build(memory_params)
    if @memory.save
      flash[:success] = '概要を作成しました'
      #memoryから詳細（log）の作成へ
      redirect_to  @memory
    else
      flash.now[:danger] = '概要の投稿に失敗しました。'
      #再度memoryの詳細を作成させる
      render 'new'
    end
  end
  
  def destroy
    @memory.destroy
    flash[:success] = '思い出を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def update
  end
  
  private
  
  def memory_params
    params.require(:memory).permit(:title, :date, :location, :image_name, :content)
  end
  
  def correct_user
    @memory = current_user.memories.find_by(id: params[:id])
    unless @memory
      redirect_to root_path
    end
  end
end
