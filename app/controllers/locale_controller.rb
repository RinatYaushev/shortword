class LocaleController < ApplicationController
  skip_before_action :authenticate_user!
  def change
    I18n.locale = params[:set_locale]

    redirect_to root_path
  end
end
