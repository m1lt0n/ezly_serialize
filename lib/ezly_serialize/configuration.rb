module EzlySerialize
  class Configuration
    class << self
      def options
        yield self 
      end

      def serializer(serializer=nil)
        @serializer ||= serializer
      end
    end
  end
end
