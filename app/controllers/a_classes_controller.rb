class AClassesController < ApplicationController
    before_action :signed_in_user
    before_action :correct_user, only: :destroy
    def new
        @a_class = current_user.a_classes.build if signed_in?
    end
    
    def create
        @a_class = current_user.a_classes.build(a_class_params)
        if @a_class.save
            flash[:success] = "Class added"
            redirect_to current_user
        else
            render 'a_classes/new'
        end
    end
    
    def destroy
        @a_class.destroy
        redirect_to current_user
    end
    
    private
    
        def a_class_params
            params.require(:a_class).permit(:name)
        end
    
    def correct_user
        @a_class = current_user.a_classes.find_by(id: params[:id])
        redirect_to root_url if @a_class.nil?
    end
end