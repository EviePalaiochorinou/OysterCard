require 'oystercard'

describe Oystercard do

  context 'Checks basic features of oystercard' do
    it 'should have a balance' do
      expect(subject).to respond_to(:balance)
    end
  end

  context 'how top-up works' do
    it 'checks if top-up increases the balance' do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end

    it 'error if top up balance tries to go over maximum balance' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ subject.top_up(1)}.to raise_error "Cannot top-up more than #{Oystercard::MAXIMUM_BALANCE}"
    end
  end

end
