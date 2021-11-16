require_relative 'helper_spec'

describe 'Teacher' do
  before :each do
    @teacher = Teacher.new(age: 30, specialization: 'Med')
  end

  describe '#new' do
    it 'teacher should be an instance of Teacher' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'can use services' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
