# frozen_string_literal: true

module Jekyll
  module Gallery
    #
    # Gallery view rendering.
    #
    class Gallery < Liquid::Tag
      include Helper

      def initialize(tag_name, text, tokens)
        super
        @@tpl_i ||= File.read(template("image", Config.gconfig)).freeze
        @@tpl_g ||= File.read(template("gallery", Config.gconfig)).freeze
        @text = text
      end

      def render(context)
        init_params(@text, context)
        site = context.registers[:site]
        tpl = []

        @files.each_with_index do |f, i|
          raise MissingFileField, { name: @name, idx: i.next } if f["file"].nil?

          file = Helper.expand_local_file(f["file"], @collection)
          raise MissingFile, file unless File.exist?(file)

          file = Helper.expand_remote_file(f["file"], @collection)
          vars = {
            "filename" => file,
            "name" => @name,
            "desc_position" => @desc_position,
            "title" => f["title"],
            "description" => f["description"],
            "a_class" => @a_class,
            "img_class" => @img_class,
            "counter" => i.next
          }
          tpl << (Liquid::Template.parse @@tpl_i).render(site.site_payload.merge!(vars))
        end

        images = tpl.join("\n")
        vars = {
          "images" => images,
          "g_class" => @g_class
        }
        (Liquid::Template.parse @@tpl_g).render site.site_payload.merge!(vars)
      end

      private

      def init_params(text, context)
        params = text.split_params(context)
        @name = params["name"]
        raise MissingGallery if @name.nil? || @name.empty?

        @a_class = params["a_class"]
        @img_class = params["img_class"]
        @g_class = params["g_class"] || ""

        @collection = context["#{Config.selector}.collection"] || context["page.collection"]
        @collection = context["#{Config.selector}.layout"] || context["page.layout"] if @collection.nil?

        @desc_position = params["desc_position"] || Config.config["desc_position"] || "bottom"

        @files = context["#{Config.selector}.gallery.#{@name}"] || context["page.gallery.#{@name}"]
        raise UnknownGallery, @name if @files.nil?
      end
    end
  end
end
