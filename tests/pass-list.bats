#!/usr/bin/env bats

load test_helper

@test "lists passwords with categories" {
  pass-init
  pass-gen-key <<EOF
User Name
user@email.com
EOF
  pass-add-device "$(hostname -s)_key.gpg"
  pass-add category1/site.com <<<secret
  pass-add category1/site2.com <<<secret
  pass-add category2/site3.com <<<secret

  run pass-list

  echo "$output"
  assert_success <<OUTPUT
├── category1
│   ├── site.com
│   └── site2.com
└── category2
    └── site3.com
OUTPUT
}
