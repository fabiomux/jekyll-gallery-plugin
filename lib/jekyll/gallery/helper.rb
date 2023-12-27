# frozen_string_literal: true

module Jekyll
  module Gallery
    #
    # Contains the methods that assist the code creation.
    #
    module Helper
      def template(tpl, gcfg)
        file = File.join(Dir.pwd, gcfg["includes_dir"], "jekyll-gallery-#{tpl}.html")
        return file if File.exist? file

        File.expand_path(File.join(__dir__, "..", "..", "jekyll-gallery-#{tpl}.html"))
      end

      def self.collection_path(collection)
        Config.c_paths[collection.to_s] || collection.to_s
      end

      def self.expand_remote_file(file, collection)
        base_path = Config.base_url
        a_path = Config.a_path

        if file =~ /\|/
          c, f = file.split("|")
          return [base_path, a_path, collection_path(c), f].join("/")
        end

        [base_path, a_path, collection_path(collection), file].join("/")
      end

      def self.expand_local_file(file, collection)
        a_path = Config.a_path
        source = Config.source

        if file =~ /\|/
          c, f = file.split("|")
          return File.join(source, a_path, collection_path(c), f)
        end

        File.join(source, a_path, collection_path(collection), file)
      end
    end
  end
end
