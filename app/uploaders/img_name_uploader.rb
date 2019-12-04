class ImgNameUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fit: [250, 250]
  end

  version :thumb_header do
    process resize_to_fit: [50, 50]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/" + [version_name, "default.png"].compact.join('_')
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
