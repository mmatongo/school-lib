require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'

class Main
  def initialize
    @classroom = Classroom.new('Microverse 2.0')
    @people = []
    @books = []
    @rentals = []
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
  end

  def run
    puts 'Welcome to School Library App! '
    puts ''

    while @option != '7'
      @options.each { |key, value| puts "#{key}) #{value}" }
      option = gets.chomp
      handle_option option
    end
  end

  private

  def handle_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    else
      puts 'That is not a valid option'
    end
  end

  def list_books
    if @books.empty?
      Gem.win_platform? ? (system 'cls') : (system 'clear')
      puts 'There are no books in the library'
      sleep(1)
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    else
      @books.each { |book| puts book }
    end
  end

  def list_people
    if @people.empty?
      Gem.win_platform? ? (system 'cls') : (system 'clear')
      puts 'There are no people in the library'
      sleep(1)
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    else
      @people.each { |person| puts person }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input!'
      return
    end

    puts 'Person created successfully!'
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: @classroom)
    @people << student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    @people << teacher
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }

    book_index = gets.chomp.to_i

    puts
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person}" }

    person_index = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals:'

    @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
  end
end

def main
  app = Main.new
  app.run
end

main
