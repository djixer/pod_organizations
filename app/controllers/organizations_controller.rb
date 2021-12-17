class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update]

  def index
    @organizations = Organization.all.order(:title)
    if @organizations.empty?
      get_organizations
    end
  end

  def show
    if @organization[:dataset].nil?
      @organization.update(dataset: get_dataset)
    end

  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def get_organizations
    include_net_libs
    url = 'https://data.gov.ru/api/json/organization/?access_token=' + get_token
    uri = URI(url)
    response = Net::HTTP.get(uri)
    organizations = JSON.parse(response)

    organizations.each do |organization|
      Organization.create(pod_id: organization['id'], title: organization['title'])
    end
  end

  def get_dataset
    include_net_libs

    url = 'https://data.gov.ru/api/json/organization/' + @organization[:pod_id] + '/dataset/?access_token=' + get_token
    uri = URI(url)
    response = Net::HTTP.get(uri)

    response == "[]" ? "Для данной организации нет данных." : response
  end

  def get_token
    open('/usr/src/token').read
  end

  def include_net_libs
    require 'json'
    require 'net/http'
  end
end
