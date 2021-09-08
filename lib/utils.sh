# stolen from https://github.com/rbenv/ruby-build/pull/631/files#diff-fdcfb8a18714b33b07529b7d02b54f1dR942
function sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' | \
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

function verlte() {
  # Used in the official asdf-nodejs plugin.
  #   https://github.com/asdf-vm/asdf-nodejs/blob/c0f37e2d14c630b04bace43c79bb361334723216/bin/install#L313-L316
  # See also:
  #   https://stackoverflow.com/questions/4023830/how-compare-two-strings-in-dot-separated-version-format-in-bash/4024263#4024263
  # Note however, that we look at the _tail_ of the list rather than the head because our sort is backwards
  [  "$1" = "$(echo -e "$1\n$2" | sort_versions | tail -n1)" ]
}
