load lib/assertions

export PASS_TEST_DIR="${BATS_TMPDIR}/pass"
export PASS_TMP_BIN="${PASS_TEST_DIR}/bin"

export PATH="${BATS_TEST_DIRNAME}/libexec:$PATH"
export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"
export PATH="${PASS_TMP_BIN}:$PATH"

mkdir -p "${PASS_TEST_DIR}"
mkdir -p "${PASS_TMP_BIN}"

teardown() {
  rm -rf "$PASS_TEST_DIR"
}
