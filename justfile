
install:
    spago install
    
build: build-purs copy

build-purs:
    spago build
    esbuild --bundle index.js --outfile=dist/index.js

copy:
    cp src/index.html dist/index.html

watch-spago:
    watchexec -e purs -- spago build && esbuild --bundle index.js --outfile=dist/index.js

watch:
	find src -name '*.purs' -or -name '*.html' -or -name '*.js' | entr npm run buildd

server: 
	cd dist && live-server --no-browser --entry-file=dist/index.html --port=8000

bundle:
     spago build --output output-es
     purs-backend-es bundle-app --main Main --minify --no-build --to dist/index.js
     
clean:
    rm -rf dist/*
