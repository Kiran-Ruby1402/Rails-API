class TagsController < ApplicationController

	def index
		tags = current_user.tags.order(created_at: :desc)
		render json: {status: SUCCESS, tags: tags, message: tags.present? ? DATA_RECEIVED_SUCCESSFULLY : DATA_NOT_FOUND}
	end

	def create
		params[:tag][:user_id] = current_user.id
		tag = Tag.new(tag_params)
		if tag.save
			render json: {status: SUCCESS, message: "User tags created successfully."}
		else
			errors = tag.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	def edit
		render json: {status: SUCCESS, users: @user, message: @user.present? ? DATA_RECEIVED_SUCCESSFULLY : DATA_NOT_FOUND}
	end

	def update
		begin
			@tag.update_attributes!(tag_params)
			render json: {status: SUCCESS, message: UPDATED_SUCCESSFULLY}
		rescue => e
			errors = @tag.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	def destroy
		begin
			@tag.destroy!
			render json: {status: SUCCESS, message: DESTROYED_SUCCESSFULLY}
		rescue => e
			errors = @tag.errors.messages.values.flatten.to_sentence rescue "Something went wrong"
			render json: {status: ERROR, message: errors}
		end
	end

	private
	def tag_params
		params.require(:tag).permit(:user_id, :description)
	end

	def find_tag
		@tag = Tag.find_by_id(params[:tag_id])
	end
end
