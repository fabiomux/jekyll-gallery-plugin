# frozen_string_literal: true

require "jekyll"

require_relative "gallery/config"
require_relative "gallery/helper"
require_relative "gallery/tags"
require_relative "gallery/utils"
require_relative "gallery/seo"

Liquid::Template.register_tag("gallery", Jekyll::Gallery::Gallery)
Jekyll::Gallery::SeoImage.setup
