#!/usr/bin/env bats

load test_helper

@test "without arguments, shows usage" {
  run pass-add

  assert_failure
  assert_line "Usage: pass add [-f] <domain>"
}

@test "adds an encrypted password to the store" {
  init_store

  run pass-add site.com <<<secret

  assert_success
  [ -e "${PASS_STORE}/passwords/site.com" ]
  [ "$(cat "${PASS_STORE}/passwords/site.com")" != "secret" ]
}

@test "adds an encrypted password with a category" {
  init_store

  run pass-add category/site.com <<<secret

  assert_success
  [ -e "${PASS_STORE}/passwords/category/site.com" ]
  [ "$(cat "${PASS_STORE}/passwords/category/site.com")" != "secret" ]
}

@test "fails to add a password that already exists on the store" {
  init_store

  pass-add site.com <<<secret
  run pass-add site.com <<<secret

  assert_failure "pass: password already exists"
  [ -e "${PASS_STORE}/passwords/site.com" ]
  [ "$(cat "${PASS_STORE}/passwords/site.com")" != "secret" ]
}

@test "overwrites a password with the -f option" {
  init_store

  pass-add site.com <<<secret
  run pass-add -f site.com <<<secret2

  assert_success
  [ "$(pass-read site.com)" = "secret2" ]
}
