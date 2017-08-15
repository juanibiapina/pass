#!/usr/bin/env bats

load test_helper

@test "without arguments, print usage" {
  run pass-read

  assert_failure
  assert_line "Usage: pass read <domain>"
}

@test "reads a password from the store" {
  init_store
  pass-add site.com <<<secret

  run pass-read site.com

  assert_success "secret"
}

@test "reads a multiline password from the store" {
  init_store
  pass-add -m site.com <<EOF
multi
line
EOF

  run pass-read site.com

  assert_success "multi
line"
}

@test "reads a password with a category" {
  init_store
  pass-add category/site.com <<<secret

  run pass-read category/site.com

  assert_success "secret"
}
