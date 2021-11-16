require_relative 'helper_spec'

describe 'Corrector' do
  before :each do
    @corrector = Corrector.new
  end

  describe '#new' do
    it '@corrector is an instance of Corrector' do
      expect(@corrector).to be_an_instance_of Corrector
    end
  end

  describe '#name' do
    context 'name should be downcase' do
      it 'return capitalised name' do
        expect(@corrector.correct_name('david')).to eq('David')
      end
    end

    context 'name should be trimmed' do
      it 'return trimmed name' do
        expect(@corrector.correct_name('david andarealllylongstring')).to eq('David anda')
      end
    end
  end
end
