class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = nil
      item = @@items.find{|i| i.name == item_name }
      if !item
        resp.write "Item not found\n"
        resp.status = 400
      else
        resp.write "#{item.price}\n"
      end
    else
      resp.write "Route not found\n"
      resp.status = 404
    end
    
    resp.finish
  end
  
end 