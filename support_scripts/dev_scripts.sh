#!/bin/bash

run_unit_tests() {
  # https://testsigma.com/blog/flutter-test-coverage/
  flutter test --coverage;
  exclude_from_lcov
  genhtml coverage/lcov.info -o coverage
  open coverage/index.html
}

exclude_from_lcov() {

  # ref: https://pub.dev/packages/remove_from_coverage/install
  echo "excluding files..."
  remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
  remove_from_coverage -f coverage/lcov.info -r 'data/models'
  # removing templates
  remove_from_coverage -f coverage/lcov.info -r 'core/usecases'
  # not sure how to test Hive locally yet
  remove_from_coverage -f coverage/lcov.info -r 'local_data_source.dart$'
  remove_from_coverage -f coverage/lcov.info -r 'domain/entities'
}


run_int_tests() {
  flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
}

gen_uml() {
  flutter pub global run dcdg -o dalbum-app-uml.puml
}

gen_routes() {
  dart run build_runner build --delete-conflicting-outputs
}

gen_mocks() {
  dart run build_runner build --delete-conflicting-outputs
}



#function to display menu
show_menu() {
  clear
  echo "-- DEV MENU ----------------------------------------"
  echo "1. Run all tests, generate coverage report "
  echo "2. Run all integration tests "
  echo "3. Generate PlantUML "
  echo "4. Generate routes "
  echo "5. Generate code/mocks "
  echo "6. exit "
}

# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 6] " choice
	case $choice in
		1) run_unit_tests ;;
		2) run_int_tests ;;
    3) gen_uml ;;
    4) gen_routes ;;
    5) gen_mocks ;;
		6) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menu
	read_options
done
}