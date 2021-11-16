require_relative 'helper_spec'

describe 'Student' do
  before :each do
    @classroom = Classroom.new('Microverse 2.0')
    @student = Student.new(age: 20, classroom: @classroom)
  end

  describe '#new' do
    it 'student should be an instance of Student' do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe '#classroom' do
    it 'student is assigned correct class' do
      expect(@student.classroom).to eql @classroom
    end
  end

  describe '#play_hooky' do
    it 'print contents of play_hooky' do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
