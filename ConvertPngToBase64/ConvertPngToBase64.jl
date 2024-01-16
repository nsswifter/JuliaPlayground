using Base64
using Images

function convert_png_to_base64(source_dir::AbstractString, dest_dir::AbstractString)
    # Step 1: List all .png files in the source directory
    png_files = filter(file -> occursin(r"\.png$", file), readdir(source_dir))

    for png_file in png_files
        # Step 2: Read and encode the content in base64
        file_path = joinpath(source_dir, png_file)
        img_data = read(file_path)
        base64_data = base64encode(img_data)

        # Step 3: Save the base64-encoded content in the destination directory
        dest_file_path = joinpath(dest_dir, "$(replace(png_file, r"\.png$" => ".txt"))")
        write(dest_file_path, base64_data)
    end
end

# Replace 'source_directory' and 'destination_directory' with your actual directory paths
source_directory = "./Input"
destination_directory = "./Output"

convert_png_to_base64(source_directory, destination_directory)
