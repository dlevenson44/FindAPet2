class Pet < ApplicationRecord
	#set required fields
	validates :name, :post_type, :aniaml, :presence => true
	#declares model has an attachment in the picture column
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
	#validates the content type being uploaded is an image
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
	

	belongs_to :user
end