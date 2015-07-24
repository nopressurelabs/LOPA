class TakeActionController < ApplicationController

  def stop_lopa
    @count = TakeAction.count
    @action = TakeAction.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @action = TakeAction.new take_action_params

    if @action.save
      redirect_to action_stop_lopa_2015_path, notice: "Thanks for adding your signature."
    else
      redirect_to action_stop_lopa_2015_path, notice: "We are sorry something went wrong."
    end
  end

  private
    def take_action_params
      params.require(:take_action).permit(
        :firstname,
        :lastname,
        :email,
        :subscribe,
        :anonymous,
        :zipcode,
        :city,
        :country,
        :us_based
      )
    end
end
