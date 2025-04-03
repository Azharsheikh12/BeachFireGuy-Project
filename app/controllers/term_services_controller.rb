class TermServicesController < ApplicationController
  def index
    @term_service = TermService.last
  end
end
