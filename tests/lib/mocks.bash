mock_gpg() {
  export PATH="${BATS_TEST_DIRNAME}/fixtures/commands/gpg:$PATH"
}

mock_command_output() {
  local command="$1"
  local output="$2"

  mkdir -p "${PASS_TEST_DIR}/path/$command"

  cat > "${PASS_TEST_DIR}/path/$command/$command" <<SH
#!/usr/bin/env bash

echo "$output"
SH

  chmod +x "${PASS_TEST_DIR}/path/$command/$command"
  export PATH="${PASS_TEST_DIR}/path/$command:$PATH"
}

disable_key_protection() {
  export KEY_PROTECTION="%no-protection"
}
