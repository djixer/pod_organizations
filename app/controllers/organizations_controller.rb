class OrganizationsController < ApplicationController

  before_action :set_organizations

  def index

  end

  def show
  end

  private

  def set_organizations
    auth_token = open('/usr/src/token').read
    require 'json'
    require 'net/http'

    url = 'https://data.gov.ru/api/json/organization/?access_token=' + auth_token
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @organizations = JSON.parse(response)
  end

  def set_organization
    #@organization = @organizations[]
  end

  def set_token

  end

end
