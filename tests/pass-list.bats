#!/usr/bin/env bats

load test_helper

@test "lists passwords with categories" {
  init_store
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
