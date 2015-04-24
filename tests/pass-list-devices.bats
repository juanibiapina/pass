#!/usr/bin/env bats

load test_helper

@test "lists all your devices" {
  pass-init
  pass-add-device "${FIXTURES_DIR}/dummy_public_key.gpg"
  pass-add-device "${FIXTURES_DIR}/other_public_key.gpg"

  run pass-list-devices

  assert_success
  assert_output "Dummy Device
Other Device"
}
