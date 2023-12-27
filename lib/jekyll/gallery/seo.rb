# frozen_string_literal: true

module Jekyll
  module Gallery
    #
    # Expand the image:cover paths to accomplish the
    # Jekyll-Gallery filesystem standards and return
    # a path compatible with the Jekyll-Seo-Tag plugin.
    #
    class SeoImage
      def self.setup
        Jekyll::Hooks.register :documents, :pre_render do |document|
          image = document["image"]
          collection = document.type

          update_frontmatter(image, collection)
        end
      end

      def self.update_frontmatter(image, collection)
        return unless image.is_a? Hash
        return if image["cover"].nil?

        file = Helper.expand_local_file(image["cover"], collection)
        raise MissingFile, file unless File.exist?(file)

        image["path"] = Helper.expand_remote_file(image["cover"], collection)
      end
    end
  end
end
