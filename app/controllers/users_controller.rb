class UsersController < ApplicationController

	skip_before_action :authenticate_request, only: [:create]
	before_action :find_user, only: [:edit, :update, :destroy]

	def index
		users = User.order(:first_name)
		render json: {status: SUCCESS, users: users, message: users.present? ? DATA_RECEIVED_SUCCESSFULLY : DATA_NOT_FOUND}
	end

	def create
		params[:user][:password] = "12345678"
		params[:user][:password_confirmation] = "12345678"
		user = User.new(user_params)
		if user.save
			render json: {status: SUCCESS, message: "User registered successfully."}
		else
			errors = user.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	def edit
		render json: {status: SUCCESS, users: @user, message: @user.present? ? DATA_RECEIVED_SUCCESSFULLY : DATA_NOT_FOUND}
	end

	def update
		begin
			@user.update_attributes!(user_params)
			render json: {status: SUCCESS, message: UPDATED_SUCCESSFULLY}
		rescue => e
			errors = @user.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	def destroy
		begin
			@user.destroy!
			render json: {status: SUCCESS, message: DESTROYED_SUCCESSFULLY}
		rescue => e
			errors = @user.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :date_of_birth, :email, :password, :password_confirmation)
	end

	def find_user
		@user = User.find_by_id(params[:user_id])
	end
end
