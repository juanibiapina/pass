#!/usr/bin/env bats

load test_helper

@test "with extra args, shows usage" {
  run pass-commands commands

  assert_failure
  assert_line "Usage: pass commands"
}
