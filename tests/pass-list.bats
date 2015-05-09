#!/usr/bin/env bats

load test_helper

@test "lists passwords with categories" {
  init_store
  pass-add category1/site1.com <<INPUT
secret
INPUT
  pass-add category1/site2.com <<INPUT
secret
INPUT
  pass-add category2/site3.com <<INPUT
secret
INPUT

  run pass-list

  assert_success
  assert_output <<OUTPUT
├── category1
│   ├── site1.com
│   └── site2.com
└── category2
    └── site3.com
OUTPUT
}

@test "lists passwords with paths" {
  init_store
  pass-add category1/site1.com <<INPUT
secret
INPUT
  pass-add category1/site2.com <<INPUT
secret
INPUT
  pass-add category2/site3.com <<INPUT
secret
INPUT

  run pass-list --porcelain

  assert_success
  assert_output <<OUTPUT
category1/site1.com
category1/site2.com
category2/site3.com
OUTPUT
}

@test "doesn't fail to list passwords even if the list is empty" {
  init_store

  run pass-list --porcelain

  assert_success ""
}
