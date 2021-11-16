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

  def parse_rentals(people, books)
    file = 'rentals.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        book = books.find { |current_book| current_book.title == rental['book']['title'] }
        person = people.find { |current_person| current_person.id == rental['person']['id'].to_i }

        Rental.new(rental['date'], book, person)
      end
    else
      []
    end
  end

  def init_student(person, classroom)
    name = person['name']
    age = person['age']
    id = person['id'].to_i
    parent_permission = person['parent_permission']

    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    student.id = id
    student
  end

  def init_teacher(person)
    name = person['name']
    age = person['age']
    id = person['id'].to_i
    specialization = person['specialization']

    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    teacher.id = id
    teacher
  end

  def preserve(people:, rentals:, books:)
    File.open('people.json', 'w') { |f| f.write JSON.generate(people) } unless people.empty?
    File.open('books.json', 'w') { |f| f.write JSON.generate(books) } unless books.empty?
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(rentals) } unless rentals.empty?
  end
end
