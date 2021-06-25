module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author.to_s, repo.to_s, target: '_blank', rel: 'noopener noreferrer'
  end

  def header_menu(current_user)
    if current_user
      render partial: 'shared/user', locals: { user: current_user, session: session }
    else
      link_to 'Log in', login_path
    end
  end

  def show(flash)
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
