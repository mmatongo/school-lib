require_relative 'helper_spec'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Microverse 2.0')
    @student = Student.new(age: 20, classroom: @classroom)
    @classroom.add_student @student
  end

  describe '#new' do
    it 'classroom is an instance of Corrector' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#students' do
    it 'return a "has-many" relationship for Student' do
      expect(@classroom).to have_attributes('students' => [@student])
    end
  end

  describe '#label' do
    it 'returns the class label' do
      expect(@classroom.label).to eql 'Microverse 2.0'
    end
  end

  describe '#add_student' do
    context 'classroom' do
      it 'should add a student' do
        expect(@classroom.students).to include(@student)
      end
    end

    context 'student' do
      it 'return the correct classroom' do
        expect(@student.classroom).to eql @classroom
      end
    end
  end
end
