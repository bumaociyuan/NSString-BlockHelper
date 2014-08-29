Pod::Spec.new do |s|
  s.name     = 'NSString-BlockHelper'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = "NSString+BlockHelper"
  s.homepage = 'https://github.com/bumaociyuan/NSString-BlockHelper'
  s.authors  = { 'bumaociyuan' => 'http://bumaociyuan.github.io/' }
  s.source   = { :git => 'https://github.com/bumaociyuan/NSString-BlockHelper.git', :tag => '1.0.0' }
  s.source_files = 'NSString-BlockHelper/NSString-BlockHelper.{h,m}'
  s.requires_arc = true
end