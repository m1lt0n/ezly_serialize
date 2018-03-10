module EzlySerialize
  class Configuration
    class << self
      def options
        yield self 
      end

      def serializer(serializer=nil)
        if serializer.nil?
          @serializer
        else
          @serializer = serializer
        end
      end
    end
  end
end
