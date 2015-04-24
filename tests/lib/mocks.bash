mock_gpg() {
  export PATH="${BATS_TEST_DIRNAME}/fixtures/commands/gpg:$PATH"
}

mock_gpg_home() {
  export GNUPGHOME="${PASS_GPG_HOME_DIR}"
}
