include ApplicationHelper
class BoardsController < ApplicationController
  def new
    @board = Board.new(user: current_user)
  end
end
