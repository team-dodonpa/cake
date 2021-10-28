class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if session[:cart_detail_id]
      @customer = Cart.find(session[:cart_detail_id])
    else
      @customer = Cart.create
      session[:cart_detail_id] = @cart_detail.id
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      homes_top_path              #ここもpathはご自由に変更してください
    end
  end

  def after_sign_out_path_for(resource_or_scope)

    if resource_or_scope == :admin
      new_admin_session_path
    else
      homes_top_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:email])
  end

end
