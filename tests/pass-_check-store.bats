#!/usr/bin/env bats

load test_helper

@test "fails if there is no store" {
  run pass-_check-store

  assert_failure "pass: store not initialized"
}

@test "doesn't fail if store is initialized" {
  pass-init <<EOF
User Name
user@email.com
EOF

  run pass-_check-store

  assert_success
}
