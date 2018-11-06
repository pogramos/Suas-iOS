Pod::Spec.new do |s|
  s.name = 'Suas'
  s.version = '1.1.0'
  s.license     = { :type => 'Apache License, Version 2.0',
                    :text => <<-LICENSE
                      Copyright (c) 2010 Google Inc.
                      Licensed under the Apache License, Version 2.0 (the "License");
                      you may not use this file except in compliance with the License.
                      You may obtain a copy of the License at
                        http://www.apache.org/licenses/LICENSE-2.0
                      Unless required by applicable law or agreed to in writing, software
                      distributed under the License is distributed on an "AS IS" BASIS,
                      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
                      See the License for the specific language governing permissions and
                      limitations under the License.
                    LICENSE
                  }
  s.summary = 'Suas is a Unidirectional data flow architecture implementation for iOS, macOS, tvOS and watchOS'
  s.homepage = 'http://suas.readme.io'
  s.authors = { 'Omar Abdelhafith' => 'o.arrabi@me.com' }
  s.source = { :git => 'https://github.com/Zendesk/Suas-iOS.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'  

  s.source_files = 'Sources/**/**.swift'
end
