
class Application
    
 @@items = []

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/) 
        request_item = request.path.split("/items/").last
        item = @@items.find {|item|item.name == request_item}
        if item.nil?
          response.status = 400
          response.write "Item not found"
        else
            response.write item.price
        end
    else
        response.write "Route not found"
        response.status = 404
    end

    response.finish
    end
end