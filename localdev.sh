#!/bin/bash

rm -rf "./build" \
&& cp -r "./src/static" "./build" \
&& elm-live "src/Main.elm" \
  --dir="./build" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/bundle.js"

