class ConnectionController < ApplicationController
  def create
    @connection = Connection.new(connection_params)
    @connection.save
  end
  def destroy
    @connection = Connection.find_by(connection_params)
    @connection.destroy
  end

  private
  def connection_params
    params.permit(:followed, :follower)
  end
end
