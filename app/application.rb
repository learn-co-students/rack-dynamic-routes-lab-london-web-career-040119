class Application

  @@items = []

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/\/items\//)
      item_name = req.path.split('/items/').last
      if @@items.map(&:name).include?(item_name)
        res.write @@items.find { |i| i.name = item_name }.price
      else
        res.write("Item not found")
        res.status = 400
      end
    else
      res.write("Route not found")
      res.status = 404
    end

    res.finish
  end

end