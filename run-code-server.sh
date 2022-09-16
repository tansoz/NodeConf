#!/bin/bash

ROOT=/server

$ROOT/code-server/node $ROOT/code-server/out/server-main.js --accept-server-license-terms -p 6262 --without-connection-token --server-data-dir $ROOT/code-server-data
