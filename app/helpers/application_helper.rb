# frozen_string_literal: true

module ApplicationHelper
  def boolean_label(value)
    case value
    when true
      content_tag(:span, value, class: 'badge badge-success')
    when false
      content_tag(:span, value, class: 'badge badge-danger')
    end
  end

  def status_label(status)
    case status
    when 'planned'
      content_tag(:span, status.titleize, class: 'badge badge-warning')
    when 'confirmed'
      content_tag(:span, status.titleize, class: 'badge badge-success')
    when 'cancelled'
      content_tag(:span, status.titleize, class: 'badge badge-danger')
    when 'attended'
      content_tag(:span, status.titleize, class: 'badge badge-success')
    when 'not_attended'
      content_tag(:span, status.titleize, class: 'badge badge-danger')
    end
  end
end
