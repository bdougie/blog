require 'builder'

###
# Blog settings
###

# Time.zone = "UTC"

###
# Markdown
###

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

###
# Code highlighting
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "posts"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 50
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 50
  blog.page_link = "page/{num}"
end

# pretty_urls
activate :directory_indexes

activate :livereload

page "/feed.xml", layout: false
page "/sitemap.xml", :layout => false

# Sitemap
set :url_root, 'http://blog.briandouglas.me'
activate :search_engine_sitemap

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  #

  # meta tag helper
  activate :meta_tags
end

# move your redirects
after_build do |builder|
  src = File.join(config[:source],"_redirects")
  dst = File.join(config[:build_dir],"_redirects")
  builder.source_paths << File.dirname(__FILE__)
  builder.copy_file(src,dst)
  puts "Done building"
end
