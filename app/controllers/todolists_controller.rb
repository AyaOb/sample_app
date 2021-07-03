class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    # 1. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3. 詳細画面へのダイレクト
    redirect_to todolist_path(list.id)
  end

  # 一覧画面
  def index
    @lists = List.all
  end

  # 詳細画面
  def show
    @list = List.find(params[:id])
  end

  # 編集画面
  def edit
    @list = List.find(params[:id])
  end

  # 更新
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private
  # この下はアクションとして認識されない
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
