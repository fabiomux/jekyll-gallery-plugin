# frozen_string_literal: true

module Jekyll
  module Gallery
    #
    # Configurations required across the gem.
    #
    class Config
      def self.gconfig
        @@gconfig ||= Jekyll.configuration.freeze
      end

      def self.base_url
        @@base_url ||= gconfig["base_url"].freeze
      end

      def self.url
        @@url ||= gconfig["url"].freeze
      end

      def self.source
        @@source ||= gconfig["source"].freeze
      end

      def self.config
        @@config ||= (gconfig["jekyll-gallery"] || {}).freeze
      end

      def self.selector
        @@selector ||= (config["post_selector"] || "include.post").freeze
      end

      def self.a_path
        @@a_path ||= (config["assets_path"] || "assets/images").freeze
      end

      def self.c_paths
        @@c_paths ||= (config["collections_dir"] || {}).freeze
      end
    end
  end
end
