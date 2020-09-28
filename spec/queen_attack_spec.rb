require './queen_attack'

# rubocop:disable Metrics/BlockLength
RSpec.describe QueenAttack do
  context 'validation' do
    context 'row' do
      it 'with minus positions returns error' do
        expect { QueenAttack.new([-1, 1]) }.to raise_error(ArgumentError)
      end

      it 'with too big positions returns error' do
        expect { QueenAttack.new([8, 1]) }.to raise_error(ArgumentError)
      end
    end

    context 'column' do
      it 'with minus positions returns error' do
        expect { QueenAttack.new([1, -1]) }.to raise_error(ArgumentError)
      end

      it 'with too big positions returns error' do
        expect { QueenAttack.new([1, 8]) }.to raise_error(ArgumentError)
      end
    end
  end
  context 'row' do
    it 'can attack on the same row' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([1, 3])

      expect(white.attack?(black)).to eq true
    end

    it 'cannot attack on different row' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([2, 3])

      expect(white.attack?(black)).to eq false
    end
  end

  context 'column' do
    it 'can attack on the same column' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([3, 1])

      expect(white.attack?(black)).to eq true
    end

    it 'cannot attack on the different column' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([3, 4])

      expect(white.attack?(black)).to eq false
    end
  end

  context 'diagonal' do
    it 'can attack on the left diagonal' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([6, 6])

      expect(white.attack?(black)).to eq true
    end

    it 'cannot attack on incorrect left diagonal' do
      white = QueenAttack.new([1, 1])
      black = QueenAttack.new([6, 5])

      expect(white.attack?(black)).to eq false
    end

    it 'can attack on the right diagonal' do
      white = QueenAttack.new([1, 6])
      black = QueenAttack.new([6, 1])

      expect(white.attack?(black)).to eq true
    end

    it 'cannot attack on incorrect right diagonal' do
      white = QueenAttack.new([1, 6])
      black = QueenAttack.new([6, 2])

      expect(white.attack?(black)).to eq false
    end
  end
end
# rubocop:enable all
