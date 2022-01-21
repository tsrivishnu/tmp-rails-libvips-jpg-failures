class ImageFile < ApplicationRecord
  has_one_attached :image

  def image_variant_url
    variant = image.variant(resize_to_fill: [120, 36]).processed
    Rails.application.routes.url_helpers.rails_representation_url(variant, only_path: true)
  end
end
