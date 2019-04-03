class SearchController < ApplicationController
  def index
    render locals: {
      facade: StudentsFacade.new(params[:house])
    }
  end
end
