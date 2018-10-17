#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

# Uncomment to enable stub debugging
# export GIT_STUB_DEBUG=/dev/tty

@test "calls git fetch" {
  stub git "fetch : echo GIT FETCH"

  run $PWD/hooks/pre-command

  assert_success
  assert_output --partial "GIT FETCH"
  unstub git
}