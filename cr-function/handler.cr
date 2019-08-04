require "json"
require "./request"

class Handler
  def run(json : String = default_request)
    req = Request.from_json(json)
    sum = 0
    req.iteration_nb.times do
      sum += req.values.sum
    end
    JSON::Any.new("Hello Crystal v#{Crystal::VERSION}. The result is #{sum}")
  end

  def default_request
    JSON.build do |json|
      json.object do
        json.field "iteration_nb", 1000
        json.field "values" do
          json.array do
            json.number 1
            json.number 2
            json.number 3
          end
        end
      end
    end
  end
end
