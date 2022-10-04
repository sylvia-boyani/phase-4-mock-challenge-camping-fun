class SignupsController < ApplicationController
    def create
        # camper = Camper.find_by(id: params[:id])
        # activity = Activity.find_by(id: params[:id])

        signup = Signup.create(signup_params);
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: {errors: ["validation errors"]}, status: :unprocessable_entity
        end


    end

    private
    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end
end

end
