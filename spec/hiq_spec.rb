# frozen_string_literal: true

require 'spec_helper'

describe Hiq do
  it 'has the current version' do
    expect(Hiq::VERSION).to eql('0.3.0')
  end

  describe '#haiku' do
    describe 'errors' do
      context 'when provided with a too long word (ie. exceeding 7 syllables)' do
        it 'raises WordLengthError' do
          expect { Hiq.haiku('nonheterosexuality') }.to raise_error(Hiq::WordTooLongError)
        end
      end

      context 'when provided with a two words exceeding 5 syllables' do
        it 'raises WordsCompositionError' do
          expect { Hiq.haiku('adaptability', 'heterosexuality') }.to raise_error(Hiq::WordsCompositionError)
        end
      end

      context 'when there are more that 3 words' do
        it 'raises TooManyWordsError' do
          expect do
            Hiq.haiku('friend', 'calamity', 'ability', 'apple')
          end.to raise_error(Hiq::TooManyWordsError)
        end
      end
    end

    describe 'haikus properties' do
      context 'simple haiku' do
        it 'has three lines' do
          expect(Hiq.haiku('apple', 'waffle').count("\n")).to eql(2)
        end

        it 'follows 5-7-5 syllable composition' do
          lines = Hiq.haiku('apple', 'waffle').split("\n").map { |l| l.split(' ') }

          syllable_composition = lines.map { |l| l.map { |w| syllables(w) }.sum }

          expect(syllable_composition).to eql([5, 7, 5])
        end
      end

      context 'multiple haiku calls' do
        let(:haikus) { Array.new(5) { Hiq.haiku('mug', 'moment') } }

        it 'can result in a different haiku for the same params' do
          expect(haikus.uniq.size).to be > 1
        end
      end
    end
  end
end
