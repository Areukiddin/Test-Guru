module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author.to_s, repo.to_s, target: '_blank', rel: 'noopener noreferrer'
  end
end
