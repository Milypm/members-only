module PostsHelper
  def post_index_user_signed
    if user_signed_in?
      "Hi, #{current_user.name}!"
    else
      'Want to Add a New Post?'
    end
  end

  def post_index_user_button
    if user_signed_in?
      link_to 'Add New Post', new_post_path(@post), class: 'btn btn-outline-success'
    else
      link_to 'Sign In', new_user_session_path, class: 'btn btn-outline-success'
    end
  end

  def post_index_author(post)
    "Created by #{post.user.name}" if user_signed_in?
  end

  def post_show_author
    "Created by #{@post.user.name}" if user_signed_in?
  end

  def post_show_editbtn
    link = link_to 'Edit', edit_post_path(@post), class: 'btn btn-success btn-sm'
    link unless @post.user != current_user
  end

  def post_show_delbtn
    link = link_to 'Delete', @post, method: :delete,
    data: { 
      confirm: 'Are you sure?' 
    }, class: 'btn btn-danger btn-sm'
    link unless @post.user != current_user
  end
end
