test:
	make test-ios
	make test-mac

test-ios:
	xcodebuild -project Suas.xcodeproj -scheme SuasIOS -destination 'platform=iOS Simulator,name=iPhone X,OS=12.2' -sdk iphonesimulator12.2 -configuration Debug ONLY_ACTIVE_ARCH=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES test

test-mac:
	xcodebuild -project Suas.xcodeproj -scheme SuasMac -sdk macosx10.14 -configuration Debug ONLY_ACTIVE_ARCH=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES test

clean:
	xcodebuild -project Suas.xcodeproj -scheme SuasIOS clean -destination 'platform=iOS Simulator,name=iPhone X,OS=12.2' | xcpretty
	xcodebuild -project Suas.xcodeproj -scheme SuasMac clean
	rm -rf ./build
doc:
	rm -rf docs

	jazzy \
  --author "Zendesk" \
  --author_url http://zendesk.com \
  --github_url https://github.com/Zendesk/Suas-iOS/tree/master \
  --output docs \
  --xcodebuild-arguments -scheme,"SuasIOS" \
  --github-file-prefix https://github.com/Zendesk/Suas-iOS \
  --theme fullwidth
	