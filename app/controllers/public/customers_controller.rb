class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  #マイページへのアクション
  def show
   @customer = current_customer
  end

  #登録情報編集へのアクション
  def edit
   @customer = current_customer
  end

  #登録情報の編集を保存するアクション
  def update
   @customer = current_customer
   if @customer.update(customer_params)
    flash[:notice] = "登録情報の変更が完了しました。"
    redirect_to customers_my_page_path
   else
    flash[:notice] = "登録情報の変更に失敗しました。"
    render 'edit'
   end
  end

 #登録情報編集画面から退会ページを表示するアクション
  def unsubscribe
  end

  #退会アクション
  def is_deleted
   @customer = current_customer
   #is_deletedカラムにフラグを立てる(defaultはfalse)
   @customer.update(is_deleted: true)
   reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end



  private

  def customer_params
   params.require(:customer).permit(:first_name, :last_name, :first_kana, :last_kana, :zip, :address, :phone_number, :email)
  end
end
