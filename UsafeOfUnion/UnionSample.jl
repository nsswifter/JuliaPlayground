# Define a union type for valid input types
input_type = Union{Int, Float64, String}

# Function that performs different operations based on input type
function process_input(value::input_type)
    if isa(value, Int)
        return "Received an integer: $value"
    elseif isa(value, Float64)
        return "Received a float: $value"
    elseif isa(value, String)
        return "Received a string: $value"
    else
        return "Unsupported input type"
    end
end
