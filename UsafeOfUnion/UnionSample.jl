# Define a union type for valid input types
InputType = Union{Int, Float64, String}

# Functions that perform different operations based on input type

# First Approach of Control Flow
function process_input(value::InputType)::String
    if isa(value, Int)
        "Received an integer: $value"
    elseif isa(value, Float64)
        "Received a float: $value"
    elseif isa(value, String)
        "Received a string: $value"
    else
        "Unsupported input type"
    end
end

# Second Approach of Control Flow
# This version of the function will be called.
# The first version is immediately redefined by the second version,
# and the second definition takes precedence.
function process_input(value::InputType)::String
    isa(value, Int) ? "Received an integer: $value" :
    isa(value, Float64) ? "Received a float: $value" :
    isa(value, String) ? "Received a string: $value" :
    "Unsupported input type"
end

# Examples
result1 = process_input(42)
result2 = process_input(3.14)
result3 = process_input("Hello, Julia!")

println(result1)  # Output: Received an integer: 42
println(result2)  # Output: Received a float: 3.14
println(result3)  # Output: Received a string: Hello, Julia!
