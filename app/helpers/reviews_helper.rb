module ReviewsHelper

    def highest_score
        order(:score)
    end
end
