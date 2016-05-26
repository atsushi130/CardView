# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'CardView' do
	pod "Koloda"
end

target 'CardViewTests' do
	pod "Koloda"
end

target 'CardViewUITests' do

end

post_install do |installer|
`find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end
