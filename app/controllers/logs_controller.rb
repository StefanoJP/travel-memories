class LogsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  end

  def new
    @log = Log.new
  end

  def create
    #参考：@memory = current_user.memories.build(memory_params)
    @log = Log.new(log_params)
    if @log.save
      flash[:success] = '思い出をひとつ記録しました。'
      redirect_to @log.memory
    else
      flash[:danger] = '思い出を記録できませんでした。'
      @memory = @log.memory
      @logs = @memory.logs
      #render :action => "show", :layout => "memoryies/show"
      render 'memories/show'
      
    end
  end


  def destroy
    @log = Log.find(params[:id])
    @memory = @log.memory
    @log.destroy
    flash[:success] = '思い出のひとつを削除しました。'
    #redirect_back(fallback_location: root_path)
    redirect_to @memory
  end

  def edit
    @log = Log.find(params[:id])
  end
  
  def update
    @log = Log.find(params[:id])
    @memory = @log.memory
    if @log.update(log_params)
      flash[:success] = '思い出は正常に更新されました'
      redirect_to @memory
    else
      flash.now[:danger] = '思い出は更新されませんでした'
      render :edit
    end
    
  end
  
  private
  
  def log_params
    params.require(:log).permit(:memory_id, :title, :date, :location, :content, :image_name, :image_name_cache)
  end
  
  def present_memory
    @present_memory = Memory.find_by(id: params[:memory_id])
  end
end
