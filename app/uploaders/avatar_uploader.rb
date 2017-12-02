class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.user.avatar_width, Settings.user.avatar_heigh]

  storage :file

  def default_url *_args
    ActionController::Base.helpers.asset_path("imagedefault/" +
      [version_name, "avatar.png"].compact.join("_"))
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
