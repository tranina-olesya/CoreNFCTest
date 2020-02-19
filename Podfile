platform :ios, '11.0'

use_frameworks!
inhibit_all_warnings!
workspace 'CoreNFCTest'

def utils
  pod 'SwiftGen', '6.1.0'
  pod 'SwiftLint', '0.37.0'
end

def surf_lib
  pod 'ReactiveDataDisplayManager' , :git => 'https://github.com/surfstudio/ReactiveDataDisplayManager', :tag => '5.0.1' 
end

def common_pods
  utils
  surf_lib
end

target 'CoreNFCTest' do
  common_pods

end
