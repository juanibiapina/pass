#!/usr/bin/env bats

load test_helper

@test "generates a private key for this device" {
  mock_gpg_home

  run pass-gen-key <<EOF
User Name
user@email.com
EOF

  assert_success
  key_name="$(pass-_gpg --with-colons --list-secret-keys | grep '^sec' | cut -d ':' -f 10)"
  [ "$key_name" = "User Name (pass#$(hostname -s)) <user@email.com>" ]
}

@test "generates a public key for this device" {
  mock_gpg_home

  run pass-gen-key <<EOF
User Name
user@email.com
EOF

  assert_success
  key_name="$(pass-_gpg --with-colons --list-public-keys | grep '^pub' | cut -d ':' -f 10)"
  [ "$key_name" = "User Name (pass#$(hostname -s)) <user@email.com>" ]
}
