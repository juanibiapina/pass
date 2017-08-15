#!/usr/bin/env bats

load test_helper

@test "generates a private key for this device" {
  run pass-gen-key <<EOF
User Name
user@email.com
EOF

  assert_success
  key_name="$(pass-_gpg --with-colons --list-secret-keys | grep '^uid' | cut -d ':' -f 10)"
  [ "$key_name" = "User Name (pass#$(hostname -s)) <user@email.com>" ]
}

@test "generates a public key for this device" {
  run pass-gen-key <<EOF
User Name
user@email.com
EOF

  assert_success
  key_name="$(pass-_gpg --with-colons --list-public-keys | grep '^uid' | cut -d ':' -f 10)"
  [ "$key_name" = "User Name (pass#$(hostname -s)) <user@email.com>" ]
}

@test "prints the public key to stdout" {
  run pass-gen-key <<EOF
User Name
user@email.com
EOF

  assert_success
  [ -e "$(hostname -s)_key.gpg" ]
}
