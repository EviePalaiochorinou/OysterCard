require 'journey'
require 'oystercard'

describe Journey do
    let(:entrystation) { double :entry_station}
    let(:exitstation) { double :exit_station}

    before do
        @journey = Journey.new(entrystation)
    end

    describe '#start' do
      it 'sets @entry_station' do
        expect(@journey.entry_station).to be_truthy
      end
    end

    describe '#finish' do
        it 'sets @exit_station' do
            @journey.finish(exitstation)
            expect(@journey.exit_station).to be_truthy
        end
    end

    describe '#fare' do
        context 'valid entry and exit' do
            it 'return the minimum fare' do
                @journey.finish(exitstation)
                expect(@journey.fare).to eq Oystercard::MINIMUM_CHARGE
            end
        end

        context 'valid entry but no exit' do
            it 'returns the penalty fare' do
                expect(@journey.fare).to eq Journey::PENALTY_FARE
            end
        end
    end
end