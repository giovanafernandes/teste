class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
    helper_method :current_user
		helper_method :current_page

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
            if @current_user.nil?
                session[:user_id] = nil
                session[:membership] = nil
						else
								branch = Branch.find(@current_user.branch_id)
								membership = Membership.find(branch.membership_id)
								accessKey = AccessKey.find(membership.access_key_id)
								session[:membership] = membership.active
								session[:testing] = accessKey.isTestingKey
								session[:remaining_days] = (accessKey.end_period.to_date - Time.now.to_date).to_i
            end

						@current_user
        else
						@current_user = nil
        end
    end

		def current_page
				request.original_url
		end
end
