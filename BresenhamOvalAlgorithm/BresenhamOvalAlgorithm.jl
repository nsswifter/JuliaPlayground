using Plots

function draw_oval(a, b)
    # Initialize variables
    x = 0
    y = b
    d = 4 * b^2 - a^2 * (4 * b - 1)

    # Store points of the oval
    points = [(x, y)]

    while b^2 * (x + 1) < a^2 * (y - 0.5)
        # Plot the points by symmetry
        append!(points, [(x, y), (x, -y), (-x, y), (-x, -y)])
        
        if d < 0
            d += 4 * b^2 * (2 * x + 3)
        else
            d += 4 * b^2 * (2 * x + 3) + a^2 * (-2 * y + 2)
            y -= 1
        end
        x += 1
    end

    while y >= 0
        # Plot the points by symmetry
        append!(points, [(x, y), (x, -y), (-x, y), (-x, -y)])
        
        if d < 0
            d += 4 * b^2 * (2 * x + 2) + a^2 * (-2 * y + 3)
            x += 1
        else
            d += a^2 * (-2 * y + 3)
        end
        y -= 1
    end

    return points
end

# Draw the oval
a = 10
b = 2
oval_points = draw_oval(a, b)
x_values = [point[1] for point in oval_points]
y_values = [point[2] for point in oval_points]

scatter(x_values, 
        y_values, 
        aspect_ratio=:equal,
        marker=:circle,
        markersize=5,
        color=:red, 
        background_color="#0E0D24", 
        title="Bresenham's Oval Algorithm", 
        xlabel="X", 
        ylabel="Y",
        legend=false)
