require 'digest'

class MembershipsController < ApplicationController

    def create
        if params[:commit] == "Continuar avaliação"
            hash = Digest::SHA256.hexdigest 'abc'

            att = {
                key: hash,
                start_period: Time.now,
                end_period: Time.now + 7.days,
                isUsed: 1,
                isTestingKey: 1
            }

            accessKey = AccessKey.new(att);

            if accessKey.save
                att = {
                    cnpj: params[:cnpj],
                    active: 1,
                    access_key_id: accessKey.id
                }

                membership = Membership.new(att)
                if membership.save
                    att = {
                        main: 1,
                        name: params[:name],
                        cnpj: params[:cnpj],
                        membership_id: membership.id,
                    }

                    branch = Branch.new(att)
                    if branch.save
                        update_id branch, true
                        redirect_to '/app'
                    end
                else
                    render json: {status: 'ERROR', message:'membership not saved', data:membership.errors},status: :unprocessable_entity
                end
            end
        # else if params[:commit] == "Efetuar pagamento"

        end
    end

    private
        def membership_params
            params.require(:membership).permit(:name, :cnpj, :active)
        end

		def update_id (branch, testing)
			current_user.branch_id = branch.id
            current_user.save
            session[:membership] = true
            session[:testing] = testing
            session[:remaining_days] = 7
		end
end
