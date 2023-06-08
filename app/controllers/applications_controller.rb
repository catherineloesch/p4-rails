class ApplicationsController < ApplicationController
        # before_action :set_application, only: [:show, :edit, :update, :destroy]
        # before_action only: [:create, :destroy, :update]
      
        def index
            @job = User.find(params[:user_id]).jobs.find(params[:job_id])
            # @applications = Application.where(user_id: params[:user_id], job_id: params[:job_id])

            render json: @job
        end
      
        # def all
        #     @jobs = Job.all
        #     render json: @jobs
        # end
      
        # def one
        #   @job = Job.find(params[:id])
        #   render json: @job
      
        # end
      
        # def show
        #     render json: @job
        # end
      
        # def create
        #   @user = User.find(params[:user_id])
        #   @job = @user.jobs.create(job_params)
        #   if @job.valid?
        #     render json: @job
        #   else
        #     render json: @job.errors, status: :unprocessable_entity
        #   end
        # end
      
        # def update
        #     if @job.update(job_params)
        #       render json: @job
        #     else
        #       render json: @job.errors, status: :unprocessable_entity
        #     end
        # end
      
        # def destroy
        #     @job.destroy
        #     render json: @job
        # end
      
        # private
        # def set_application
        #     @job = User.find(params[:user_id]).jobs.find(params[:id])
        # end
      
        # def job_params
        #     params.require(:job).permit(:title, :description, :pay, :start_date, :start_time, :end_date, :end_time, :user_id, :job_type, :location)
        # end
      
      
end
