class ApplicationController < ActionController::API
  def hello
    render json: { response: 'hello world' }, status: 200
  end
end
