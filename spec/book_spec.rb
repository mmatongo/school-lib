require_relative 'helper_spec'

describe 'Book' do
  before :each do
    @book = Book.new('On Love', 'Khalil Gibran')
  end

  describe '#new' do
    it 'returns a new Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the book title' do
      expect(@book.title).to eql 'On Love'
    end
  end

  describe '#author' do
    it 'returns the book author' do
      expect(@book.author).to eql 'Khalil Gibran'
    end
  end
end
