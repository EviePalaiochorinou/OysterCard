require 'oystercard'

describe Oystercard do
  let(:station) { double :entry_station }
  let(:exitstation) { double :exit_station }


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

  context 'deduct method' do
    it 'allows the balance to be decucted' do
      expect{subject.send(:deduct)}.to change {subject.balance}.by -(Oystercard::MINIMUM_CHARGE)
    end
  end

  context 'touch in method' do
    it 'checks that the user is in journey' do
      subject.top_up(50)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it "can touch in" do
      subject.top_up(50)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'checks it card remembers entry station' do
      subject.top_up(50)
      subject.touch_in(station)
      expect(subject.entry_station).to be_truthy
    end
  end

  context 'in journey method' do
    it 'checks whether a card is currently being used' do
      expect(subject.in_journey?).to eq false
    end
  end

  context 'touch out method' do
    it 'checks that the user is not in journey' do
      subject.touch_out(exitstation)
      expect(subject.in_journey?).to eq false
    end

    it "can touch out" do
      subject.top_up(50)
      subject.touch_in(station)
      subject.touch_out(exitstation)
      expect(subject).not_to be_in_journey
    end

    it 'checks whether it can remember the exit station' do
      subject.top_up(50)
      subject.touch_in(station)
      subject.touch_out(exitstation)
      expect { subject.touch_out(exitstation) }.to change{subject.journeys.length}.by(1)
    end

    it 'checks if the deduction is made ' do
      subject.top_up(10)
      subject.touch_in(station)
      expect{subject.touch_out(exitstation)}.to change {subject.balance}.by -(Oystercard::MINIMUM_CHARGE)
    end
  end
  
  context 'error if funds insufficient for journey' do
    it 'checks if there are sufficient funds for a journey' do
      expect{subject.touch_in(station)}.to raise_error "You need to top-up first"
    end
  end
end

