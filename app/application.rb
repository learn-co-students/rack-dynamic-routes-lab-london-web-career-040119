class Application



  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/item_name/)
      resp.write "#{item_name.price}"
    else
      resp.write "Item not found"
      resp.status = 404
    end
    resp.finish
  end


end
