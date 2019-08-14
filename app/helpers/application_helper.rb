# frozen_string_literal: true

module ApplicationHelper
  def current_class?(inventory)
    inventory.item_count < inventory.low_item_threshold ? 'red' : ''
  end
end
