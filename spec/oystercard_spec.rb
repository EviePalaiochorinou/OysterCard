require 'oystercard'

describe Oystercard do
  
  it 'should have a balance' do
    expect(subject).to respond_to(:balance)

  end

  context 'how top-up works' do
    it 'checks if top-up increases the balance' do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end
  end

end