class LocaleController < ApplicationController
  def change
    I18n.locale = params[:set_locale]

    redirect_to root_path
  end
end
