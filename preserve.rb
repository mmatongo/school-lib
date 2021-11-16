require 'json'

class Preserver
  def the_objector(classroom)
    books = parse_books
    people = parse_people(classroom)
    rentals = parse_rentals(people, books)

    {
      'people' => people,
      'books' => books,
      'rentals' => rentals
    }
  end

  def parse_books
    file = 'books.json'

    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def parse_people(classroom)
    file = 'people.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |person|
        if person['json_class'] == 'Student'
          init_student(person, classroom)
        else
          init_teacher(person)
        end
      end
    else
      []
    end
  end
end
