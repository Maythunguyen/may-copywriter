module ApplicationHelper
  def error_messages_for(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      content_tag(:li, msg)
    end.join

    html = <<-HTML
      <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">#{pluralize(resource.errors.count, 'error')} prohibited this #{resource.class.name.downcase} from being saved:</strong>
        <ul class="list-disc pl-5">
          #{messages}
        </ul>
      </div>
    HTML

    html.html_safe
  end
end
