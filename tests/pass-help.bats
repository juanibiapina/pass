#!/usr/bin/env bats

load test_helper

@test "without args shows summary of common commands" {
  run pass-help
  assert_success
  assert_line "Usage: pass <command> [<args>]"
  assert_line "Some useful pass commands are:"
}

@test "invalid command" {
  run pass-help hello
  assert_failure "pass: no such command 'hello'"
}

@test "shows help for a specific command" {
  cat > "${PASS_TEST_DIR}/bin/pass-hello" <<SH
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

@test "replaces missing extended help with summary text" {
  cat > "${PASS_TEST_DIR}/bin/pass-hello" <<SH
#!shebang
# Usage: pass hello <world>
# Summary: Says "hello" to you, from pass
echo hello
SH

  run pass-help hello
  assert_success
  assert_output <<SH
Usage: pass hello <world>

Says "hello" to you, from pass
SH
}

@test "extracts only usage" {
  cat > "${PASS_TEST_DIR}/bin/pass-hello" <<SH
#!shebang
# Usage: pass hello <world>
# Summary: Says "hello" to you, from pass
# This extended help won't be shown.
echo hello
SH

  run pass-help --usage hello
  assert_success "Usage: pass hello <world>"
}

@test "multiline usage section" {
  cat > "${PASS_TEST_DIR}/bin/pass-hello" <<SH
#!shebang
# Usage: pass hello <world>
#        pass hi [everybody]
#        pass hola --translate
# Summary: Says "hello" to you, from pass
# Help text.
echo hello
SH

  run pass-help hello
  assert_success
  assert_output <<SH
Usage: pass hello <world>
       pass hi [everybody]
       pass hola --translate

Help text.
SH
}

@test "multiline extended help section" {
  cat > "${PASS_TEST_DIR}/bin/pass-hello" <<SH
#!shebang
# Usage: pass hello <world>
# Summary: Says "hello" to you, from pass
# This is extended help text.
# It can contain multiple lines.
#
# And paragraphs.

echo hello
SH

  run pass-help hello
  assert_success
  assert_output <<SH
Usage: pass hello <world>

This is extended help text.
It can contain multiple lines.

And paragraphs.
SH
}
