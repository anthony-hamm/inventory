class SnapshotForm
  include ActiveModel::Model

  attr_accessor :store

  def submit(items)
    snapshot = Snapshot.new(store: store)
    data = store.stocks.inject({}) do |json, stock|
      item = items.find { |i| i["id"] == stock.item_id.to_s}
      total_loss = 0
      total_excess = 0
      if item[:quantity].to_i > stock.quantity
        total_excess = item[:quantity].to_i - stock.quantity
      elsif stock.quantity > item[:quantity].to_i
        total_loss = stock.quantity - item[:quantity].to_i
      end
      json[stock.id] = { old: stock.quantity, new: item[:quantity].to_i, total_loss: total_loss, total_excess: total_excess  }
      json
    end
    snapshot.items = data
    snapshot.total_loss = data.sum {|item_id, hash| hash[:total_loss] }
    snapshot.total_excess = data.sum {|item_id, hash| hash[:total_excess] }
    snapshot.save!
  end

end
