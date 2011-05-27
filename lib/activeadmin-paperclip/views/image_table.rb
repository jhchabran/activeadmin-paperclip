module ActiveAdmin
  module Views
    class ImageTableFor < AttributesTable
      builder_method :image_table_for

      def build(record, attachment_name, *styles)
        
        raise "Record cannot be nil." if record.nil?
        @attachment = attachment = (record.respond_to? attachment_name.to_sym) ? record.send(attachment_name.to_sym) : nil

        @style_list = !@attachment.nil? ? @attachment.styles.collect do |style| style.first end : []
        add_class "paperclip"
        add_class "attributes_table"
        styles = collect_styles(*styles)
        super record, *styles
        
      end

      # Collects and organizes the list of styles to display. If :except or :only are
      # provided, these modify the list that is displayed. If no styles are provided, 
      # all are displayed.
      def collect_styles(*styles)
        @options = {}
        styles.each do |style|
          @options.update(styles.delete(style)) if style.is_a?(Hash)
        end
        
        # If no styles provided, we adapt all styles.
        styles = styles.empty? ? @style_list.clone : styles
        
        # except = styles.delete(:except)
        except = @options[:except]
        except = [except] if (except && !except.is_a?(Enumerable))
        except.collect! do |item| item.is_a?(String) ? item.to_sym : item end if !except.nil?
        # only = styles.delete(:only)
        only = @options[:only]
        only = [only] if (!only.nil? && !only.is_a?(Enumerable))
        only.collect! do |item| item.is_a?(String) ? item.to_sym : item end if !only.nil?

        # Only defaults to all styles if not defined.
        if !only.nil? then
          # Remove styles to display if not in only group
          styles.delete_if do |item| !only.include?(item) end
        end
        # Remove excepted styles
        if !except.nil? then
          styles.delete_if do |item| except.include?(item) end
        end

        styles
      end
      
      # Overrides the content_for_attribute and returns the content
      # from the list of styles for the image attachment
      def content_for_attribute(attr)

        if @style_list.include?(attr) 
          src = @attachment.url(attr)
          image_tag src, :style => "max-width:100%", :class => "style-#{attr.to_s}" if @attachment.file?
        elsif @record.respond_to?(attr.to_sym)  
          super(attr)
        end
        
      end
      
      
    end

    # class ImageTable < ImageTableFor
    #   builder_method :image_table
    #   def build(attachment_name, *styles)
    #     super resource.send(attachment_name.to_sym), *styles
    #   end
    # end

  end
end