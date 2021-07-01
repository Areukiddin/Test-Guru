module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author.to_s, repo.to_s, target: '_blank', rel: 'noopener noreferrer'
  end

  def header_menu(current_user)
    if user_signed_in?
      render partial: 'shared/user', locals: { user: current_user }
    else
      link_to 'Log in', new_user_session_path
    end
  end
end
