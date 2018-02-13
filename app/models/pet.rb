class Pet < ApplicationRecord
	#declares model has an attachment in the picture column
	has_attached_file :picture, styles: { large: "600x600>", medium: "450x450>" }
	#validates the content type being uploaded is an image
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  	validates :name, :post_type, :animal, :breed, :age, :description, :presence => true

	belongs_to :user
end