class CustomAuthenticationFailureAdmin < Devise::FailureApp
  protected
  def redirect_url
    if request.parameters[:controller] == 'blogs'
      blogs_path
    else
      root_path
    end
  end
end