mock_gpg() {
  export PATH="${BATS_TEST_DIRNAME}/fixtures/commands/gpg:$PATH"
}

mock_gpg_home() {
  export GNUPGHOME="${PASS_GPG_HOME_DIR}"
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
