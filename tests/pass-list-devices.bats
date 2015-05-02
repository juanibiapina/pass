#!/usr/bin/env bats

load test_helper

@test "lists all your devices marking the current one" {
  mock_command_output hostname "Dummy Device"
  pass-init
  pass-add-device "${FIXTURES_DIR}/dummy_public_key.gpg"
  pass-add-device "${FIXTURES_DIR}/other_public_key.gpg"

  run pass-list-devices

  assert_success
  assert_output <<OUTPUT
* Dummy Device
  Other Device
OUTPUT
}

@test "lists devices for scripting" {
  mock_command_output hostname "Dummy Device"
  pass-init
  pass-add-device "${FIXTURES_DIR}/dummy_public_key.gpg"
  pass-add-device "${FIXTURES_DIR}/other_public_key.gpg"

  run pass-list-devices --porcelain

  assert_success
  assert_output <<OUTPUT
Dummy Device
Other Device
OUTPUT
}
