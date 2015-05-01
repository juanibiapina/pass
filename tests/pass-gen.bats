#!/usr/bin/env bats

load test_helper

@test "without arguments, show usage" {
  run pass-gen

  assert_failure
  assert_line "Usage: pass gen <domain>"
}

@test "generate a password for a domain" {
  init_store

  run pass-gen site.com

  assert_success
  password="$(pass-read site.com)"
  [ "${#password}" = 15 ]
}
