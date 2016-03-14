class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = @subjects.paginate page: params[:page]
  end

  def new
  end

  def show
  end

  def create
    if @subject.save
      flash[:success] = t "views.subject.complete_create"
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:status]
      @subject.update_attributes status: params[:status]
      flash[:success] = params[:status] == "finish" ?
        t("update_status_finish") : t("update_status_unfinish")
      redirect_to admin_subjects_path
    else
      if @subject.update_attributes subject_params
        flash[:success] = t "views.subject.complete_update"
        redirect_to admin_subjects_path
      else
        render :edit
      end
    end
  end

  def destroy
    @subject.destroy
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :content,
      tasks_attributes: [:id, :subject_id, :name, :_destroy]
  end
end
