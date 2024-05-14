using Plots

function draw_circle(radius)
    # Initialize variables
    x = 0
    y = radius
    d = 3 - 2 * radius

    # Store points of the circle
    points = [(x, y)]

    while x <= y
        # Plot the points by symmetry
        append!(points, [(x, y), (y, x), (-x, y), (-y, x),
                         (-x, -y), (-y, -x), (x, -y), (y, -x)])
        
        if d < 0
            d += 4 * x + 6
        else
            d += 4 * (x - y) + 10
            y -= 1
        end
        x += 1
    end

    return points
end

# Draw the circle
radius = 15
circle_points = draw_circle(radius)
x_values = [point[1] for point in circle_points]
y_values = [point[2] for point in circle_points]

scatter(x_values, 
        y_values, 
        aspect_ratio=:equal,
        marker=:circle,
        markersize=5,
        color=:red, 
        background_color="#0E0D24", 
        title="Bresenham's Circle Algorithm", 
        xlabel="X", 
        ylabel="Y",
        legend=false)
