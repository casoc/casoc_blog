# encoding: utf-8
class GalleryUploader < BaseUploader

  version :normal do
    process :resize_to_fit => [250, 185]
  end

  version :small do
    process :resize_to_fit => [120, 89]
  end

  version :right_banner do
    process :resize_to_fit => [50, 37]
  end

end
