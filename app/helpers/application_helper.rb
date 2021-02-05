module ApplicationHelper
  def about_human_member
    userkind = 'Hello, '
    if user_signed_in?
      userkind += 'Member!'
    else 
      userkind += 'Human!'
    end
  end
end
