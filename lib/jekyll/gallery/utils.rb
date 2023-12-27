# frozen_string_literal: true

module Jekyll
  module Gallery
    #
    # Convert the params to hash
    #
    class ::String
      def split_params(context)
        scan(/(\w+)=(?:(["'])(.+?)\2|([^ ]+))/)
          .to_h do |x|
            x[3] = context[x[3]] if x[1].nil?
            x.delete_at 1
            x.compact
          end
      end
    end

    #
    # Remove nil or empty items.
    #
    class ::Array
      def cleanup
        delete_if { |x| x.nil? || x.to_s.empty? }
      end
    end

    #
    # Invalid group name error
    #
    class InvalidGroup < StandardError
      def initialize(name)
        super "The group '#{name}' is not valid!"
      end
    end

    #
    # No gallery name specified.
    #
    class MissingGallery < StandardError
      def initialize
        super "No gallery name has been specified!"
      end
    end

    #
    # The specified gallery name doesn't exist.
    #
    class UnknownGallery < StandardError
      def initialize(name)
        super "The gallery '#{name}' doesn't exist!"
      end
    end

    #
    # Not existing file.
    #
    class MissingFile < StandardError
      def initialize(name)
        super "The file '#{name}' doesn't exist"
      end
    end

    #
    # Not existing file field
    #
    class MissingFileField < StandardError
      def initialize(data)
        super "No 'file' field in the gallery '#{data[:name]}' item n.#{data[:idx]}!"
      end
    end
  end
end
