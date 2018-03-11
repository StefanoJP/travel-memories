class ToppagesController < ApplicationController
  def index
    #登録ユーザーの思い出をトップページに一覧表示
    if logged_in?
      @memories = Memory.all.order('created_at DESC').page(params[:page])
    end
  end
end
