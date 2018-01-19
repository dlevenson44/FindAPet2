class Pet < ApplicationRecord
	#declares model has an attachment in the picture column
	has_attached_file :picture, styles: { large: "600x600>", medium: "300x300>" }
	#validates the content type being uploaded is an image
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	belongs_to :user
end