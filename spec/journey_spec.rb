require 'journey'
require 'oystercard'

describe Journey do
    let(:entrystation) { double :entry_station}
    let(:exitstation) { double :exit_station}
    describe '#start' do
      it 'sets @entry_station' do
        subject.start(entrystation)
        expect(subject.entry_station).to be_truthy
      end
    end

    describe '#finish' do
        it 'sets @exit_station' do
            subject.finish(exitstation)
            expect(subject.exit_station).to be_truthy
        end
    end

    describe '#fare' do
        context 'valid entry and exit' do
            it 'return the minimum fare' do
                subject.start(entrystation)
                subject.finish(exitstation)
                expect(subject.fare).to eq Oystercard::MINIMUM_CHARGE
            end
        end

        context 'valid entry but no exit' do
            it 'returns the penalty fare' do
                subject.start(entrystation)
                expect(subject.fare).to eq Journey::PENALTY_FARE
            end
        end
    end
end