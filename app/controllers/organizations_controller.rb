class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    if @organizations.empty?
      get_organizations
    end
  end

  def show
    @organization = Organization.find(params[:pod_id])
  end

  private

  def get_organizations
    @auth_token = open('/usr/src/token').read
    require 'json'
    require 'net/http'

    url = 'https://data.gov.ru/api/json/organization/?access_token=' + @auth_token
    uri = URI(url)
    response = Net::HTTP.get(uri)
    organizations = JSON.parse(response)

    organizations.each do |organization|
      Organization.create(pod_id: organization['id'], title: organization['title'])
    end
  end

  def get_data
    include_net_libs
    get_token

    url = 'https://data.gov.ru/api/json/organization/' + params[:pod_id] + '/?access_token=' + @auth_token
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
  end

  def get_token
    @auth_token = open('/usr/src/token').read
  end

  def include_net_libs
    require 'json'
    require 'net/http'
  end
end
