class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :load_chatrooms

  private

  def load_chatrooms
    @chatrooms = Chatroom.all
  end
end
