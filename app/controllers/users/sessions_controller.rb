class Users::SessionsController < Devise::SessionsController

  ####################
  #    Redirects     #
  ####################

  def destroy
    sign_out_and_redirect(current_user)
  end

  protected

  # after logout Path
  def after_sign_out_path_for(resource_or_scope)
    Rails.logger.debug('ifan')
    root_path
  end

end
