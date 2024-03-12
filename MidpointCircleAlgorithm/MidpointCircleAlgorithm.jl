# Import the Plots package for plotting functionality
using Plots

# Define a custom struct Point to represent a point in 2D space
struct Point
    x::Int
    y::Int
end

# Implement the Midpoint Circle Algorithm
function midpoint_circle_algorithm(radius::Int)
    # Initialize starting point
    current_point = Point(0, radius)
    decision_parameter = 5/4 - radius
    # List to store circle points
    circle_points = [current_point]
    
    # Iterate until the y-coordinate crosses the x-coordinate
    while current_point.y > current_point.x
        # Check decision parameter for point selection
        if decision_parameter < 0
            # Move to the right
            current_point = Point(current_point.x + 1, current_point.y)
            # Update decision parameter
            decision_parameter += 2 * current_point.x + 1
        else
            # Move diagonally
            current_point = Point(current_point.x + 1, current_point.y - 1)
            # Update decision parameter
            decision_parameter += 2 * (current_point.x - current_point.y) + 1
        end
        
        # Add all symmetric points
        push!(circle_points, current_point)
        push!(circle_points, Point(current_point.x, -current_point.y))
        push!(circle_points, Point(-current_point.x, current_point.y))
        push!(circle_points, Point(-current_point.x, -current_point.y))
        push!(circle_points, Point(current_point.y, current_point.x))
        push!(circle_points, Point(-current_point.y, current_point.x))
        push!(circle_points, Point(current_point.y, -current_point.x))
        push!(circle_points, Point(-current_point.y, -current_point.x))
    end
    
    # Return the list of circle points
    return circle_points
end

# Draw a circle using the Midpoint Circle Algorithm
function draw_circle(center::Point, radius::Int)
    # Get circle points using Midpoint Circle Algorithm
    circle_points = midpoint_circle_algorithm(radius)
    # Plot circle points
    scatter!([point.x + center.x for point in circle_points],
             [point.y + center.y for point in circle_points], 
             aspect_ratio=:equal, 
             legend=false, 
             markersize=5, 
             marker=:circle, 
             color=:blue)
end

# Define circle parameters
center = Point(0, 0)
radius = 50

# Setup plot
plot(background_color="#0E0D24")
scatter!([center.x], [center.y], color=:red, markersize=5)

# Label the x-axis as "X", y-axis as "Y", and give the plot a title
xlabel!("X")
ylabel!("Y")
title!("Midpoint Circle Algorithm (Vectorized)")

# Draw the circle
draw_circle(center, radius)
