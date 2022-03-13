# frozen_string_literal: true

require 'spec_helper'

describe Hiq do
  it 'has the current version' do
    expect(Hiq::VERSION).to eql('0.0.1')
  end

  def syllables(word)
    word.downcase.scan(/[aeiouy]/).size - diphtongs(word) - triphtongs(word)
  end

  def diphtongs(word)
    word.downcase.scan(/[^aeiouy][aeiouy][aeiouy][^aeiouy]/).size
  end

  def triphtongs(word)
    word.downcase.scan(/[^aeiouy][aeiouy][aeiouy][aeiouy][^aeiouy]/).size
  end

  describe "#haiku" do
    describe "errors" do
      context "when provided with a too long word (ie. exceeding 7 syllables)" do
        it "raises WordLengthError" do
          expect { Hiq.haiku(["nonheterosexuality"]) }.to raise_error(Hiq::WordTooLongError)
        end
      end

      context "when provided with a two words exceeding 5 syllables" do
        it "raises WordsCompositionError" do
          expect { Hiq.haiku(["adaptability", "heterosexuality"]) }.to raise_error(Hiq::WordsCompositionError)
        end
      end

      context "when provided with words the sum of whic is exceeding 22 syllables" do
        it "raises WordsCompositionError" do
          expect { Hiq.haiku(["friend", "calamity", "ability", "heterosexuality", "apple", "probability"]) }.to raise_error(Hiq::WordsTooLongError)
        end
      end
    end

    describe "haikus properties" do
      context "simple haiku" do
        it "has three lines" do
          expect(Hiq.haiku(["apple", "waffle"]).count("\n")).to eql(2)
        end

        it "follows 5-7-5 syllable composition" do
          lines = Hiq.haiku(["apple", "waffle"]).split("\n").map { |l| l.split(" ") }
          syllable_composition = lines.map { |l| l.map {|w| syllables(w) }.sum }

          expect(syllable_composition).to eql([5, 7, 5])
        end
      end
    end
  end
end