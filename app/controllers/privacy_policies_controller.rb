class PrivacyPoliciesController < ApplicationController
  def index
    @privacy_policy = PrivacyPolicy.last
  end
end
