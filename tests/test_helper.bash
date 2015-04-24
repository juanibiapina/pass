load lib/assertions

export PASS_TEST_DIR="${BATS_TMPDIR}/pass"
export PASS_GPG_HOME_DIR="${PASS_TEST_DIR}/gpg_home"
export PASS_TMP_BIN="${PASS_TEST_DIR}/bin"

export PASS_STORE="${PASS_TEST_DIR}/store"

export FIXTURES_DIR="${BATS_TEST_DIRNAME}/fixtures"

export PATH="${BATS_TEST_DIRNAME}/libexec:$PATH"
export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"
export PATH="${PASS_TMP_BIN}:$PATH"

mkdir -p "${PASS_TEST_DIR}"
mkdir -p "${PASS_TMP_BIN}"
mkdir -p "${PASS_GPG_HOME_DIR}"

teardown() {
  rm -rf "$PASS_TEST_DIR"
}

load lib/mocks
