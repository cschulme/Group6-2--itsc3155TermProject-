module ActionView
  module Helpers
    class FormBuilder 
      def date_select(object, method, options = {}, html_options = {})
        existing_date = @object.send(method) 
        formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_date, :class => "form-control datepicker", :"data-date-format" => "YYYY-MM-DD") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end
      end

      def datetime_select(object, method, options = {}, html_options = {})
        existing_time = @object.send(method)
        existing_time ||= Time.now
        formatted_time = existing_time.to_time.strftime("%A, %B %d %Y %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control datetimepicker", :"data-date-format" => "dddd, MMMM DD YYYY hh:mm A") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end
      end
    end
  end
end