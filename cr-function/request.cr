require "json"

class Request
  JSON.mapping(
    iteration_nb: Int32,
    values: Array(Int32),
  )
end
