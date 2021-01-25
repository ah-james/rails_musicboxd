module ReviewsHelper

    def review_index_header
        if params[:album_id]
            content_tag(:h1, "All Reviews for #{@album.title} by #{@album.artist.artist_name}")
        else
            content_tag(:h1, "All Reviews")
        end
    end

    def review_new_header
        if params[:album_id]
            content_tag(:h1, "New Album Review for #{@album.title}")
        else
            content_tag(:h1, "New Album Review")
        end
    end

    def review_show_header
        if @review.user_id == session[:user_id]
            content_tag(:h1, "Your Review for #{@review.album.title} by #{@review.album.artist.artist_name}")
        else
            content_tag(:h1, "#{@review.user.name}'s Review for #{@review.album.title} by #{@review.album.artist.artist_name}")
        end
    end
end
