# frozen_string_literal: true

require "json"

commit = IO.popen(%w[git rev-parse --verify HEAD], &:read).strip
abort "Could not identify the checked-out site revision." unless commit.match?(/\A[0-9a-f]{40}\z/)
expected = ARGV.first
if expected && !expected.empty? && expected != commit
  abort "The build requested #{expected}, but the checked-out revision is #{commit}."
end
File.write("_site/rpl-site-revision.json", JSON.generate(commit: commit) + "\n")
