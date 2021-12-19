require 'rails_helper'

RSpec.describe Organization, type: :model do
  
  describe 'validation tests' do

    it 'ensures title is present' do
      organization = Organization.new(pod_id: '123')
      expect(organization.valid?).to eq(false)
    end

    it 'ensures pod_id is present' do
      organization = Organization.new(title: 'Title of Organization')
      expect(organization.valid?).to eq(false)
    end

    it 'should be able to save organization' do
      organization = Organization.new(pod_id: '123', title: 'Title of Organization')
      expect(organization.save).to eq(true)
    end

    it 'ensures pod_id is unique' do
      organization_1 = Organization.new(pod_id: '123', title: 'Title')
      organization_2 = Organization.new(pod_id: '123', title: 'Title')
      expect(organization_1.save).to eq(true)
      expect(organization_2.save).to eq(false)
    end
    
  end
end