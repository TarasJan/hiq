# frozen_string_literal: true

module Hiq
  # Provided of filler for lines of haiku
  class FillerLibrary
    def self.interpolated_fillers
      {
        5 => {
          1 => 'the X',
          2 => 'ghastly X',
          3 => 'shadow of X',
          4 => 'X of my joy fade'
        },
        7 => {
          1 => 'a X',
          2 => 'the pale X',
          3 => 'X in silence',
          4 => 'X ends the autumn',
          5 => 'A spark of X above',
          6 => 'the sad facade of X torn'
        }
      }
    end

    def self.fillers
      {
        5 => ['empty riverside', 'tears flow in the rain', 'cheerful summer\'s charm'].shuffle,
        7 => ['the vain wind of summer blows', 'gentle breeze upon a mountain', 'a frog jumps into a well'].shuffle
      }
    end

    attr_reader :ifillers, :cfillers

    def initialize
      @ifillers = FillerLibrary.interpolated_fillers
      @cfillers = FillerLibrary.fillers
    end

    def get_const_filler(syllable_length)
      cfillers[syllable_length].shift
    end

    def get_interpolated_filler(syllable_length, gap_size)
      ifillers[syllable_length][gap_size]
    end
  end
end
