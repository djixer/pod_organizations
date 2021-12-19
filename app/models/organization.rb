class Organization < ApplicationRecord
	validates :pod_id, presence: true, uniqueness: true
	validates :title, presence: true
	
end
