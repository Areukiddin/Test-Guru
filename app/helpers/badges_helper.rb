module BadgesHelper
  def badge_form_header(badge)
    if badge.persisted?
      "Edit #{badge.title}"
    else
      'Create New badge'
    end
  end
end
