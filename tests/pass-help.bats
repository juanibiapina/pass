#!/usr/bin/env bats

load test_helper

@test "without args shows help for root command" {
  run pass-help

  assert_success
  assert_line "Usage: pass <command> [<args>]"
}

@test "invalid command" {
  run pass-help hello
  assert_failure "pass: no such command 'hello'"
}

@test "shows help for a specific command" {
  cat > "${PASS_TMP_BIN}/pass-hello" <<SH
#!shebang
# Usage: pass hello <world>
# Summary: Says "hello" to you, from pass
# This command is useful for saying hello.
echo hello
SH

  run pass-help hello

  assert_success
  assert_output <<SH
Usage: pass hello <world>

This command is useful for saying hello.
SH
}
