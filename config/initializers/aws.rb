CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'   (필요없음. 없애야 동작이 됨)                # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     '',                        # required
    aws_secret_access_key: '',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',   (필요없음. 없애도 됨)           # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'practice-sell'    # name_of_directory                      # required
  config.fog_public     = true # false 하면 모든 사람이 볼 수 없음(public 아님)    (필요없음. 없애도 됨)   # optional, defaults to true
  config.fog_attributes = { }#{ 'Cache-Control' => "max-age=#{365.day.to_i}" } (대괄호 안 예제인데 쓸모 없음!) (필요없음. 없애도 됨) # optional, defaults to {}
end



  # config.fog_provider = 'fog/aws' 첫째 줄은 무조건 없애줘야 동작이 되고
  # host, config.fog_public, config.fog_attributes 이 3줄은 필요없기 때문에 없애줘도 되고 있어도 동작은 됨.
  # 나머지 줄은 채워주기.(provider, aws_access_key_id, aws_secret_access_key, region, endpoint, config.fog_directory)
