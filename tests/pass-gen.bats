#!/usr/bin/env bats

load test_helper

@test "generate a password for a domain" {
  init_store

  run pass-gen

  assert_success
}
