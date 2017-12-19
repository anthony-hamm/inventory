class Snapshot < ApplicationRecord
  belongs_to :store
  validates_presence_of :store

  def summary
    items.inject([]) do |array, (item_id, hash)|
      array << "#{Item.find(item_id).name}: perdida => #{hash["total_loss"]}, exceso => #{hash["total_excess"]}"
    end.join("<br>").html_safe
  end
end
