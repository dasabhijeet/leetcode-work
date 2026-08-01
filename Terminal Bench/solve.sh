#!/bin/bash

set -e

sort /app/users.csv | uniq -d > /app/output.txt