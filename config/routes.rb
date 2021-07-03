Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # 新規投稿画面にて、「保存」押下でデータの保存（データが空のため、自動的にurlが一致するpostを実行）
  post 'todolists' => 'todolists#create'
  # 一覧画面への遷移
  get 'todolists' => 'todolists#index'
  # .../todolists/1　や　.../todolists/3　に該当する  詳細画面への遷移
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  # 各投稿内容の編集画面への遷移
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  # 編集画面にて、「編集」押下でデータの更新（既存データのため、自動的にurlが一致するpatchを実行）
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  # データの削除
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
