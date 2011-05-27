# module ActiveAdmin
#   module Views
#     class ImageSidebar < ImageTable
#       builder_method :image_sidebar
# 
#       # def build(attachment, *styles)
#       #   @attachment = attachment
#       #   @style_list = attachment.styles.collect do |style| style.first end
#       #   add_class "paperclip"
#       #   add_class "attributes_table"
#       #   styles = collect_styles(*styles)
#       #   super @attachment.instance, *styles
#       # end
#       # 
#       # # Collects and organizes the list of styles to display. If :except or :only are
#       # # provided, these modify the list that is displayed. If no styles are provided, 
#       # # all are displayed.
#       # def collect_styles(*styles)
#       #   @options = {}
#       #   styles.each do |style|
#       #     @options.update(styles.delete(style)) if style.is_a?(Hash)
#       #   end
#       #   
#       #   # If no styles provided, we adapt all styles.
#       #   styles = styles.empty? ? @style_list.clone : styles
#       #   
#       #   # except = styles.delete(:except)
#       #   except = @options[:except]
#       #   except = [except] if (except && !except.is_a?(Enumerable))
#       #   except.collect! do |item| item.is_a?(String) ? item.to_sym : item end if !except.nil?
#       #   # only = styles.delete(:only)
#       #   only = @options[:only]
#       #   only = [only] if (!only.nil? && !only.is_a?(Enumerable))
#       #   only.collect! do |item| item.is_a?(String) ? item.to_sym : item end if !only.nil?
#       # 
#       #   # Only defaults to all styles if not defined.
#       #   if !only.nil? then
#       #     # Remove styles to display if not in only group
#       #     styles.delete_if do |item| !only.include?(item) end
#       #   end
#       #   # Remove excepted styles
#       #   if !except.nil? then
#       #     styles.delete_if do |item| except.include?(item) end
#       #   end
#       # 
#       #   styles
#       # end
#       # 
#       # # Overrides the content_for_attribute and returns the content
#       # # from the list of styles for the image attachment
#       # def content_for_attribute(attr)
#       #   if @style_list.include?(attr) 
#       #     image_tag @attachment.url(attr), :style => "max-width:100%", :class => "style-#{attr.to_s}"
#       #   else
#       #     super(attr)
#       #   end
#       # end
#       
#       
#     end
#   end
# end