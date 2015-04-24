#!/usr/bin/env bats

load test_helper

@test "invokes gpg passing arguments" {
  mock_gpg

  run pass-_gpg arg1 arg2

  assert_success "gpg arg1 arg2"
}
