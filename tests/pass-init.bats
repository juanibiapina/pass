#!/usr/bin/env bats

load test_helper

@test "initializes the store" {
  run pass-init
  assert_success "pass: store initialized at ${PASS_STORE}"
  [ -e "${PASS_STORE}" ]
  [ -e "${PASS_STORE}/keyring.gpg" ]
}

@test "warns in case the store is already initialized" {
  pass-init

  run pass-init

  assert_failure "pass: store already initialized at ${PASS_STORE}"
}
