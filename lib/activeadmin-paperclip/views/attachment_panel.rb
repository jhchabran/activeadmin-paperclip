module ActiveAdmin
  module Views

    # Attachment Panel provides a panel that outputs all styles for
    # the provided paperclip attachment. Typically should be used on 
    # the view action.
    # 
    class AttachmentPanelFor < ActiveAdmin::Views::Panel
      builder_method :attachment_panel_for
      
      # Pass in resource in order to create a table for a resource 
      # other than the current.
      # Provide attachment_name as a symbol of the name of the paperclip
      # property. Typically, :image or :attachment
      # Attributes:
      #   Inherits attribute options from ActiveAdmin::Views::Panel, and
      #   includes :title

      def build(resource, attachment_name, attributes={})
        @resource = resource
        @attachment_name = attachment_name
        title = attributes.delete(:title) || attachment_name.to_s
        add_class "paperclip"
        super title, attributes 
        
        # attachment = (@resource.respond_to? @attachment_name.to_sym) ? @resource.send(@attachment_name.to_sym) : nil
        # image_table_for attachment, attributes
        image_table_for @resource, @attachment_name, attributes
      end
      
    end

    # Creates an attachment panel for the current resource.
    class AttachmentPanel < AttachmentPanelFor
      builder_method :attachment_panel

      def build(attachment_name, attributes = {})
        super resource, attachment_name, attributes
      end
    end


    
  end
end

