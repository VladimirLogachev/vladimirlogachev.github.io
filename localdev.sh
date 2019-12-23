#!/bin/bash

rm -rf "./build" \
&& mkdir "build" \
&& cp -r "./src/static" "./build" \
&& elm-live "src/Main.elm" \
  --dir="./build/static" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/static/bundle.js"

