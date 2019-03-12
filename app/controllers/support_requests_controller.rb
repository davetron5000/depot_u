class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all.order("created_at desc").group_by { |support_request|
      support_request.response.nil?
    }
  end

  def update
    support_request = SupportRequest.find(params[:id])
    if support_request.update(response: params.require(:support_request)[:response])
      redirect_to support_requests_path, notice: "Response sent"
    else
      redirect_to support_requests_path, notice: "Some Problem"
    end
  end
end
