#!/usr/bin/env bats

load test_helper

@test "without arguments, print usage" {
  run pass-read

  assert_failure
  assert_line "Usage: pass read <domain>"
}

@test "reads a password from the store" {
  pass-init
  pass-gen-key <<EOF
User Name
user@email.com
EOF
  pass-add-device "$(hostname -s)_key.gpg"
  pass-add site.com <<PASSWORD
secret
PASSWORD

  run pass-read site.com

  assert_success "secret"
}
