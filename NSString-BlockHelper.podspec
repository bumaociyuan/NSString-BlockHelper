Pod::Spec.new do |s|
  s.name     = 'NSString-BlockHelper'
  s.version  = '1.0.5'
  s.license  = { :type => 'MIT', :file => 'LICENSE.md' }
  s.summary  = "Category of NSString that allows using block to manipulate NSString"
  s.homepage = 'git@github.com:bumaociyuan/NSString-BlockHelper'
  s.authors  = { 'bumaociyuan' => 'http://bumaociyuan.github.io/' }
  s.source   = { :git => 'git@github.com:bumaociyuan/NSString-BlockHelper.git', :tag => s.version.to_s }
  s.source_files = 'NSString+BlockHelper/*{h,m}'
  s.requires_arc = true
end
