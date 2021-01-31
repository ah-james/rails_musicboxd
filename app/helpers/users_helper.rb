module UsersHelper

    def user_show_header
        if session[:user_id] == @user.id
            content_tag(:h1, "Hello #{@user.name}, here are your favorite albums:")
        else
            content_tag(:h1, "#{@user.name}'s  Favorite Albums")
        end
    end

    def user_show_songs
        if session[:user_id] == @user.id
            content_tag(:h3, "Your Favorite Songs:")
        else
            content_tag(:h3, "#{@user.name}'s Favorite Songs:")
        end
    end
end
