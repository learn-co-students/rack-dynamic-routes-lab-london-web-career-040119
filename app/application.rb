class Application

  @@items = [Item.new("Pen", 1.50), Item.new("Paper", 1.00), Item.new("Crayons", 3.50)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if requested_item = @@items.select {|item| item.name == item_name}[0]
        resp.write requested_item.price
      else
        resp.status = 400
        resp.write "Item not found."
      end
    else
      resp.status = 404
      resp.write "Route not found."
    end
    resp.finish
  end

end
