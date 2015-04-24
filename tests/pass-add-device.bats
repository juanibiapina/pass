#!/usr/bin/env bats

load test_helper

@test "without arguments, prints usage" {
  run pass-add-device

  assert_failure
  assert_line "Usage: pass add-device <public_key>"
}

@test "with an invalid file, displays error" {
  run pass-add-device inexistent_key.gpg

  assert_failure "pass: public key file not found"
}

@test "adds the public key to the store keyring" {
  pass-init

  run pass-add-device "${FIXTURES_DIR}/dummy_public_key.gpg"

  assert_success

  key_name="$(gpg --no-default-keyring --keyring "${PASS_STORE}/keyring.gpg" --with-colons --list-keys | grep '^pub' | cut -d ':' -f 10)"
  [ "$key_name" = "Dummy User (Dummy Device) <dummy@example.com>" ]
}
