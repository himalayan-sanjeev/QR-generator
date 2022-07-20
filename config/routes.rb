Rails.application.routes.draw do
  controller :pages do
    get :qr_code_generator
    get :qr_code_download
    get :qr_code_view
  end
  root 'pages#home'
end
