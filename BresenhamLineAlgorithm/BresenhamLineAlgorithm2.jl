using Plots

function bresenham(x1, y1, x2, y2)
    points = Tuple{Int, Int}[]
    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    sx = x1 < x2 ? 1 : -1
    sy = y1 < y2 ? 1 : -1
    err = dx - dy

    while true
        push!(points, (x1, y1))
        if x1 == x2 && y1 == y2
            break
        end
        e2 = 2 * err
        if e2 > -dy
            err -= dy
            x1 += sx
        end
        if e2 < dx
            err += dx
            y1 += sy
        end
    end
    return points
end

# Define the start and end points
start_point = (21, 12)
end_point = (29, 16)

# Apply Bresenham algorithm to get points between start and end
points = bresenham(start_point[1], start_point[2], end_point[1], end_point[2])

# Extract x and y coordinates from points
x_coords = [point[1] for point in points]
y_coords = [point[2] for point in points]

# Plot the points
plot(first.(x_coords), 
     last.(y_coords),
     marker=:circle,
     color=:red, 
     background_color="#0E0D24", 
     markersize=5, 
     legend=false, 
     xlabel="X", 
     ylabel="Y",
     title="Bresenham's Line Algorithm")
