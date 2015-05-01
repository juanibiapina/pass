init_store() {
  pass-init
  pass-gen-key <<EOF
User Name
user@email.com
EOF
  pass-add-device "$(hostname -s)_key.gpg"
}
