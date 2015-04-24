#!/usr/bin/env bats

load test_helper

@test "initializes the store" {
  run pass-init
  assert_success
  [ -e "${PASS_STORE}" ]
}

@test "warns in case the store is already initialized" {
  pass-init

  run pass-init

  assert_failure "pass: store already initialized"
}
