include ActionView::Helpers::DateHelper

class TakeActionController < ApplicationController

  def count_actions
    @count = TakeAction.count
    render json: @count
  end

  def last_actions
    @actions = TakeAction.limit(5).order('created_at DESC')
    render json: @actions, each_serializer: ActionSerializer, root: "actions"
  end

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
