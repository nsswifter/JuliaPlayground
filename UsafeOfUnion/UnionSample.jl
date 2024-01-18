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

# Examples
result1 = process_input(42)
result2 = process_input(3.14)
result3 = process_input("Hello, Julia!")

println(result1)  # Output: Received an integer: 42
println(result2)  # Output: Received a float: 3.14
println(result3)  # Output: Received a string: Hello, Julia!
