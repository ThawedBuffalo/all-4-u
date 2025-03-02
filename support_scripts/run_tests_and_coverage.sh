#!/bin/bash
set -e
flutter pub get
sh support_scripts/import_files_coverage.sh lcov_test
flutter test --coverage
