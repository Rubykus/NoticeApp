module UsersHelper
 def avatar_for(user, options= {size: '50x50'})
   size = options[:size]
   if user.avatar?
     image_tag user.avatar.url(:thumb), size: size
   else
     image_tag('/default.jpg', size: size)
   end
 end
end
