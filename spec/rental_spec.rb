require_relative 'helper_spec'

describe 'Rental' do
  book = Book.new('On Love', 'Khalil Gibran')
  person = Person.new(age: 18)
  rental = Rental.new('2021-11-16', book, person)

  it 'rental should be an instance of Rental' do
    expect(rental).to be_an_instance_of Rental
  end

  it 'rental should have a date' do
    expect(rental.date).to eql '2021-11-16'
  end

  it 'rental should have a book' do
    expect(rental.book).to eql book
  end

  it '#person' do
    expect(person.rentals).to include(rental)
  end

  it '#book' do
    expect(book.rentals).to include(rental)
  end
end
