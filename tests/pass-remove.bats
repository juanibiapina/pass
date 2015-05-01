#!/usr/bin/env bats

load test_helper

@test "without arguments, shows usage" {
  run pass-remove

  assert_failure
  assert_line "Usage: pass remove <domain>"
}

@test "warns if password doesn't exist" {
  init_store

  run pass-remove site.com

  assert_failure "pass: password not found"
}

@test "removes a password from the store" {
  init_store
  pass-add site.com <<<secret

  run pass-remove site.com

  [ ! -e "${PASS_STORE}/passwords/site.com" ]
}

@test "removes a category from the store if it is the last password in it" {
  init_store
  pass-add category/site.com <<<secret

  run pass-remove category/site.com

  [ ! -e "${PASS_STORE}/passwords/category" ]
}

@test "does not remove a category from the store if it is not the last password in it" {
  init_store
  pass-add category/site.com <<<secret
  pass-add category/site2.com <<<secret

  run pass-remove category/site.com

  [ -e "${PASS_STORE}/passwords/category" ]
  [ ! -e "${PASS_STORE}/passwords/category/site.com" ]
  [ -e "${PASS_STORE}/passwords/category/site2.com" ]
}

@test "does not remove passwords directory" {
  init_store
  pass-add category/site.com <<<secret

  run pass-remove category/site.com

  [ -e "${PASS_STORE}/passwords" ]
}
