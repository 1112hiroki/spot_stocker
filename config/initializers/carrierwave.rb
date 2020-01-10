require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
    elsif Rails.env.production? #本番はS3に保存する
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
    # Amazon S3用の設定
      provider:              'AWS',
      region:                ENV['S3_REGION'],     # 例: 'ap-northeast-1'
      aws_access_key_id:     ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY']
  }
  config.fog_directory     =  ENV['S3_BUCKET']
  config.cache_storage = :fog
end
end