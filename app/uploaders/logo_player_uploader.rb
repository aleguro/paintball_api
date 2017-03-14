class LogoPlayerUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog #:file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [125, 64]
  end
end
