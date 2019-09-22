class BoardItemsController < ApplicationController
  
  before_action :authenticate_user!
  
  
  def create
    
     board = Board.find(params[:board_id])
     @board_items = board.board_items.new(board_items_params)
    
     if @board_items.save()
       respond_to do |format|
         format.json { render json: { status: :created, board_items: board.board_items.all } }
       end
     else
       respond_to do |format|
         format.json { render json: { status: :false } }
       end
     end

  end
  
  def board_items_params
    params.require(:board_item).permit( :description, :board_id)
  end
end
