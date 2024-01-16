using JSON

function get_notable_alumni_dict(data)
    notable_alumni_dict = Dict{String, Vector{String}}()

    for university in data["universities"]
        name = university["name"]
        alumni = university["notable_alumni"]
        notable_alumni_dict[name] = alumni
    end

    return notable_alumni_dict
end

# Provided JSON data with 6 universities
json_data = """
{
  "universities": [
    {
      "name": "Harvard University",
      "location": "Cambridge, Massachusetts",
      "established_year": 1636,
      "majors": ["Computer Science", "Business Administration", "Biology"],
      "campus_size_acres": 210,
      "acceptance_rate": 4.6,
      "notable_alumni": ["Mark Zuckerberg", "Barack Obama", "Bill Gates"]
    },
    {
      "name": "Stanford University",
      "location": "Stanford, California",
      "established_year": 1885,
      "majors": ["Electrical Engineering", "Psychology", "Economics"],
      "campus_size_acres": 8180,
      "acceptance_rate": 4.3,
      "notable_alumni": ["Elon Musk", "John F. Kennedy", "Larry Page"]
    },
    {
      "name": "MIT (Massachusetts Institute of Technology)",
      "location": "Cambridge, Massachusetts",
      "established_year": 1861,
      "majors": ["Physics", "Mechanical Engineering", "Computer Science"],
      "campus_size_acres": 168,
      "acceptance_rate": 6.7,
      "notable_alumni": ["Kofi Annan", "Buzz Aldrin", "Salman Khan"]
    },
    {
      "name": "University of California, Berkeley",
      "location": "Berkeley, California",
      "established_year": 1868,
      "majors": ["Chemistry", "Political Science", "Environmental Science"],
      "campus_size_acres": 1232,
      "acceptance_rate": 16.4,
      "notable_alumni": ["Steve Wozniak", "Nobel laureate Ernest O. Lawrence"]
    },
    {
      "name": "Princeton University",
      "location": "Princeton, New Jersey",
      "established_year": 1746,
      "majors": ["Mathematics", "History", "Psychology"],
      "campus_size_acres": 600,
      "acceptance_rate": 5.5,
      "notable_alumni": ["Albert Einstein", "Michelle Obama", "Woodrow Wilson"]
    },
    {
      "name": "Caltech (California Institute of Technology)",
      "location": "Pasadena, California",
      "established_year": 1891,
      "majors": ["Physics", "Chemistry", "Astronomy"],
      "campus_size_acres": 124,
      "acceptance_rate": 6.3,
      "notable_alumni": ["Richard Feynman", "Linus Pauling", "Kip Thorne"]
    }
  ]
}
"""

# Parse JSON
parsed_data = JSON.parse(json_data)

# Get dictionary of university names and notable alumni
notable_alumni_dict = get_notable_alumni_dict(parsed_data)

# Print the result
println("Dictionary of University Names and Notable Alumni:")
for (name, alumni) in notable_alumni_dict
    println("$name: $alumni")
end
