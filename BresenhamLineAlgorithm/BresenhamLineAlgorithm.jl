"""
Draws a line between two points using Bresenham's line algorithm.

Parameters:
- `x0::Int`: x-coordinate of the starting point.
- `y0::Int`: y-coordinate of the starting point.
- `x1::Int`: x-coordinate of the ending point.
- `y1::Int`: y-coordinate of the ending point.

Returns:
- `Vector{Tuple{Int, Int}}`: An array of tuples representing the points along the line.
"""

using Plots

function draw_line(x0::Int, y0::Int, x1::Int, y1::Int)::Vector{Tuple{Int, Int}}
    dx = abs(x1 - x0)  # Change in x
    dy = abs(y1 - y0)  # Change in y
    sx = sign(x1 - x0)  # Sign of change in x
    sy = sign(y1 - y0)  # Sign of change in y
    
    if dy > dx
        dx, dy = dy, dx
        swap = true
    else
        swap = false
    end
    
    e = 2 * dy - dx  # Decision parameter
    
    x = x0
    y = y0
    
    points = Vector{Tuple{Int, Int}}(undef, dx + 1)  # Pre-allocate points array
    
    for i in 1:dx
        points[i] = (x, y)
        
        if e >= 0
            if swap
                x += sx
            else
                y += sy
            end
            e -= 2 * dx
        end
        
        if swap
            y += sy
        else
            x += sx
        end
        
        e += 2 * dy
    end
    
    points[end] = (x1, y1)  # Ensure the last point is included
    return points
end

# Get the points and draw the line
points = draw_line(-3, 4, -1, -1)

# Setup and draw plot
plot(first.(points), last.(points), marker=:circle, color=:red, background_color="#0E0D24", markersize=5, legend=false, xlabel="X", ylabel="Y", title="Bresenham's Line Algorithm")
