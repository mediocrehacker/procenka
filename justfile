
install:
    spago install
    
build: build-purs copy

build-purs:
    spago build
    esbuild --bundle index.js --outfile=dist/index.js

copy:
    cp src/index.html dist/index.html

watch:
    watchexec -e js,purs,css,html just build

watch-purs:
    watchexec -e js,purs,css,html just build

bundle:
     spago build --output output-es
     purs-backend-es bundle-app --main Main --minify --no-build --to dist/index.js
     
clean:
    rm -rf dist/*
