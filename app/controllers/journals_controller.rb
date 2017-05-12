class JournalsController < ApplicationController

  def index
  end

  def show
    redirect_to "/"
  end

  def new
  end

  def create
    @journal = Journal.create(journal_params)
    if @journal.save
      flash[:notice] = "Saved"
      redirect_to zodiac_path(:id: params[:zodiac_id])
    else
      flash[:alert] = "Save unsucessful"
      render "new"
    end
  end

  def destroy
  end




  private
  def journal_params
    params.require(:journal).permit(:user_id, :predict_id, :comment)
  end

end
