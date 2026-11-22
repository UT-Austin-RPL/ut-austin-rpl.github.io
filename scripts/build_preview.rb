# frozen_string_literal: true

require "digest"
require "find"
require "tempfile"
require "uri"
require "yaml"

# Unchanged public files from the existing production site. A replacement at any
# of these paths must fit in Pages or receive its own working download URL.
PRODUCTION = "https://ut-austin-rpl.github.io"
MAX_ASSET_BYTES = 25 * 1024 * 1024
LEGACY_PDFS = {
  "publications/papers/zhu-phd-dissertation.pdf" => "902c37ed9b5eac3999646c98e7757bb60197966bc9e0ede231cbefb48b313e28",
  "talks/2022_02_18_stanford_yukezhu_rpl.pdf" => "7d5908d3f2a563cb6f74c9818ce066fa1943362a965d5d8ff8868c017fd92b14",
  "talks/building_general_purpose_robot_autonomy.pdf" => "21c4b0a112fe7d75e1a1a935ca5a4d8e63ebbf39afa31d1e8d40c08d16a9e9d2",
  "talks/closing_perception_action_loop.pdf" => "6ab4d3dad1ad774adf23b8fd978592381253d9088a8fc456cef5be4cf46bf438",
  "talks/data_pyramid_for_building_generalist_agents.pdf" => "c9050d450c591677a8bdce491d62a582fc4b299afc8d4691d8822ced992618fa",
  "talks/keypoint_representations_for_interaction.pdf" => "60e227829c672abae55aa2667a19b5bc48dad4489090571fb81ccffc0bbff103",
  "talks/visual_affordance_learning_for_robot_manipulation.pdf" => "8dae4cc4b806956cb246d5a51c3ef3beaf8ee88ff57fe2310bbdb336293fed71",
  "talks/visual_imitation_learning_rss2020.pdf" => "2df137698a961f2776853db99c9cd207e43059f410243321d1fa4052ea1fd513"
}.freeze

def oversized_preview_files(output)
  redirects = []
  Find.find(output) do |file|
    abort "Unsupported symlink in preview output: #{file}" if File.symlink?(file)
    next unless File.file?(file) && File.size(file) > MAX_ASSET_BYTES

    path = file.delete_prefix(output + "/")
    unless LEGACY_PDFS[path] && Digest::SHA256.file(file).hexdigest == LEGACY_PDFS.fetch(path)
      abort "Preview asset exceeds Cloudflare Pages' 25 MiB limit: #{path} (#{File.size(file)} bytes). " \
            "Reduce it or link to a separately hosted version before previewing this change."
    end
    redirects << path
  end
  redirects.sort
end

def build_preview
  raw_url = ENV["CF_PAGES_URL"] || ENV["RPL_PREVIEW_URL"]
  abort "Set CF_PAGES_URL or RPL_PREVIEW_URL to this preview's HTTPS origin." unless raw_url
  url = URI.parse(raw_url)
  unless url.is_a?(URI::HTTPS) && url.host && !url.userinfo && !url.query && !url.fragment &&
         ["", "/"].include?(url.path) && url.host.downcase != URI(PRODUCTION).host
    abort "The preview URL must be a separate HTTPS origin without a path, query or fragment."
  end
  origin = raw_url.delete_suffix("/")
  output = File.expand_path("_site")
  abort "Preview output must be a local directory: #{output}" if File.symlink?(output)
  settings = {"url" => origin, "baseurl" => "", "rpl_review_preview" => true,
              "google_analytics" => false, "google_tag_manager" => false}
  Tempfile.create(["rpl-preview", ".yml"]) do |config|
    config.write(YAML.dump(settings))
    config.flush
    system({"JEKYLL_ENV" => "production"}, "bundle", "exec", "jekyll", "build", "--trace",
           "--config", "_config.yml,#{config.path}", "--destination", output, exception: true)
  end

  redirects = oversized_preview_files(output)
  # Validate all original link targets before substituting exact Pages redirects.
  system({"SITE_URL" => origin, "SITE_BASEURL" => ""}, Gem.ruby, "scripts/verify_site.rb", exception: true)
  system(Gem.ruby, "scripts/test_publication_sort.rb", exception: true)
  system(Gem.ruby, "scripts/test_site_url_scope.rb", exception: true)
  system("node", "scripts/test_legacy_redirect.cjs", exception: true)
  homepage = File.read(File.join(output, "index.html"))
  unless homepage.include?("data-rpl-review-preview") && homepage.include?('content="noindex, nofollow"') &&
         !homepage.match?(%r{google-analytics\.com/analytics\.js|googletagmanager\.com/(?:gtm\.js|ns\.html)})
    abort "The preview homepage must identify the draft, exclude indexing and disable Google Analytics."
  end

  File.write(File.join(output, "_redirects"), redirects.map { |path| "/#{path} #{PRODUCTION}/#{path} 302\n" }.join)
  redirects.each { |path| File.delete(File.join(output, path)) }
  File.write(File.join(output, "_headers"), "/*\n  X-Robots-Tag: noindex, nofollow, noarchive\n" \
            "/rpl-site-revision.json\n  Cache-Control: no-store\n")
  system(Gem.ruby, "scripts/write_site_revision.rb", ENV.fetch("CF_PAGES_COMMIT_SHA", ""), exception: true)
  File.write(File.join(output, "robots.txt"), "User-agent: *\nDisallow: /\n")
  puts "Review site ready in _site for #{origin}; #{redirects.length} unchanged PDFs link to production."
rescue URI::InvalidURIError
  abort "Invalid preview URL."
end

build_preview if $PROGRAM_NAME == __FILE__
