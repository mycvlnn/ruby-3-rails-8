module Api
  module V1
    class BaseController < ActionController::API
      include ErrorFormatter
    end
  end
end
