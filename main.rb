require_relative 'classroom'
require_relative 'handlers'

class App
  include Handlers

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

    loop do
      @options.each { |key, value| puts "#{key}) #{value}" }

      option = gets.chomp
      break if option == '7'

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
end

def main
  app = App.new
  app.run
end

main
