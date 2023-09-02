#!/bin/bash

goose postgres "postgres://exp:exp@localhost:15432/exp" "$@"

