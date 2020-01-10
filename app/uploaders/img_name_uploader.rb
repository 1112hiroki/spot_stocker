class ImgNameUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  version :thumb do
    process resize_to_fit: [400, 400]
  end

  version :thumb_header do
    process resize_to_fit: [80, 80]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/" + [version_name, "default.png"].compact.join('_')
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    original_filename if original_filename
  end

end
