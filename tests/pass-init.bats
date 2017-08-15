#!/usr/bin/env bats

load test_helper

@test "warns in case the store is already initialized" {
  pass-init <<EOF
User Name
user@email.com
EOF

  run pass-init <<EOF
User Name
user@email.com
EOF

  assert_failure "pass: store already initialized at ${PASS_STORE}"
}

@test "initializes the files in the store" {
  run pass-init <<EOF
User Name
user@email.com
EOF

  assert_success

  [ -d "${PASS_STORE}" ]
  [ -e "${PASS_STORE}/keyring.gpg" ]
  [ -d "${PASS_STORE}/passwords" ]
}

@test "generates a public key" {
  run pass-init <<EOF
User Name
user@email.com
EOF

  assert_success

  key_name="$(pass-_gpg --list-public-keys --with-colons | grep '^uid' | cut -d ':' -f 10)"

  [ "$key_name" = "User Name <user@email.com>" ]
}

@test "generates a private key" {
  run pass-init <<EOF
User Name
user@email.com
EOF

  assert_success

  key_name="$(pass-_gpg --list-secret-keys --with-colons | grep '^uid' | cut -d ':' -f 10)"

  [ "$key_name" = "User Name <user@email.com>" ]
}
