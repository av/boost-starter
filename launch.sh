#!/bin/bash

docker run \
  -e "HARBOR_BOOST_OPENAI_URLS=http://172.17.0.1:11434/v1" \
  -e "HARBOR_BOOST_OPENAI_KEYS=sk-ollama" \
  -e "HARBOR_BOOST_MODULES=dot;klmbr;promx;autotemp;markov;" \
  -e "HARBOR_BOOST_KLMBR_MODS=all" \
  -e "HARBOR_BOOST_KLMBR_PERCENTAGE=35" \
  -e "HARBOR_BOOST_PUBLIC_URL=http://localhost:8004" \
  -v ./boost_modules:/app/custom_modules \
  -p 8004:8000 \
  ghcr.io/av/harbor-boost:latest