module UsersHelper

  def avatar_for(user, options= {size: '50x50'})
   size = options[:size]
   if user.avatar?
     image_tag user.avatar.url(:thumb), size: size
   else
     image_tag('/default.jpg', size: size)
   end
  end

  def current_user_do(actions)
    if params[:id].to_i == current_user.id
      actions
    end
  end


  def check_delegate
    current_user.id == params[:id].to_i || User.find_by_id(params[:id]).friends.collect { |f| f.relation }.include?(current_user.id)
  end

end
