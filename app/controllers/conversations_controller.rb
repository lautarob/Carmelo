class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:is_simple_conversation]
      if Conversation.between(params[:sender_id],params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.new
        @conversation.sender = User.find(params[:sender_id])
        @conversation.recipient = User.find(params[:recipient_id])
        @conversation.is_simple_conversation = true
        @conversation.save
      end
    else
      @users_ids = params[:users_ids]
      @conversation = Conversation.new
      @users_ids.each do |user_id|
        @user = User.find(user_id)
        @conversation.users << @user
      end
      @conversation.is_simple_conversation = false
      @conversation.save
    end
    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    render json: @messages
  end

end
