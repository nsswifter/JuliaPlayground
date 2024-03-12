# Import the Plots package for plotting functionality
using Plots

# Define a custom struct Point to represent a point in 2D space
struct Point
    x::Int  # x-coordinate of the point
    y::Int  # y-coordinate of the point
end

# Draw a line between two points using the Digital Differential Analyzer (DDA) algorithm
function draw_line_dda(start::Point, destination::Point)
    # Calculate change in x and y coordinates
    delta_x = destination.x - start.x  
    delta_y = destination.y - start.y 

    # Determine the number of steps needed
    steps = max(abs(delta_x), abs(delta_y))

    # Calculate increment for x and y coordinates
    x_increment = delta_x / steps  
    y_increment = delta_y / steps  

    # Initialize current x and y coordinates
    current_x = start.x  
    current_y = start.y

    for i in 1:steps
        # Plot each point along the line using circles with blue color
        plot!([round(Int, current_x)], [round(Int, current_y)], marker=:circle, color=:blue)
        # Move to the next x and y coordinates
        current_x += x_increment  
        current_y += y_increment
    end
end

# Define the entry and destination points
entry_point = Point(2, 3)
destination_point = Point(44, 48)  

# Plot setup: set x and y axis limits, hide legend, set frame style to origin
plot(xlims=(0, 50), ylims=(0, 50), legend=false, framestyle=:origin, background_color="#0E0D24")

# Draw the line using DDA algorithm
draw_line_dda(entry_point, destination_point)

# Plot the entry and destination points as red circles with marker size 5
scatter!([entry_point.x, destination_point.x], [entry_point.y, destination_point.y], color=:red, markersize=5)

# Label the x-axis as "X", y-axis as "Y", and give the plot a title
xlabel!("X")
ylabel!("Y")
title!("Digital Differential Analyzer (DDA) Algorithm")
