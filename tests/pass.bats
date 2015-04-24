#!/usr/bin/env bats

load test_helper

@test "default PASS_STORE" {
  PASS_STORE= run pass echo PASS_STORE
  assert_output "$HOME/.pass-store"
}

@test "inherited PASS_STORE" {
  PASS_STORE=/tmp/pass run pass echo PASS_STORE
  assert_output "/tmp/pass"
}
