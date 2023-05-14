require_relative 'parse_methods'

module FontAwesome5Rails
  module Parsers
    class FaLayeredIconParser
      include ParseMethods

      attr_reader :aligned, :style, :size, :title

      def initialize(options)
        @aligned = options[:aligned].nil? ? true : options[:aligned]
        @style = options[:style]
        @size = options[:size]
        @title = options[:title]
        @options = options
      end

      def classes
        @classes ||= parse_classes
      end

      private

      def parse_classes
        tmp = ['fa-layers']
        tmp << 'fa-fw' if @aligned
        tmp += @options[:class].split(' ') unless @options[:class].nil?
        tmp.uniq.join(' ').strip
      end
    end
  end
end
