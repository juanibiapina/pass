#!/usr/bin/env bats

load test_helper

@test "without arguments, shows usage" {
  run pass-add

  assert_failure
  assert_line "Usage: pass add <domain>"
}

@test "adds an encrypted password to the store" {
  pass-init
  pass-gen-key <<EOF
User Name
user@email.com
EOF
  pass-add-device "$(hostname -s)_key.gpg"

  run pass-add site.com <<PASSWORD
secret
PASSWORD

  assert_success
  [ -e "${PASS_STORE}/passwords/site.com" ]
  [ "$(cat "${PASS_STORE}/passwords/site.com")" != "secret" ]
}

@test "adds an encrypted password with a category" {
  pass-init
  pass-gen-key <<EOF
User Name
user@email.com
EOF
  pass-add-device "$(hostname -s)_key.gpg"

  run pass-add category/site.com <<PASSWORD
secret
PASSWORD

  assert_success
  [ -e "${PASS_STORE}/passwords/category/site.com" ]
  [ "$(cat "${PASS_STORE}/passwords/category/site.com")" != "secret" ]
}
