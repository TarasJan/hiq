# frozen_string_literal: true

module Hiq
  # Provided of filler for lines of haiku
  class FillerLibrary
    def self.interpolated_fillers
      {
        1 => ['the X', 'a X'],
        2 => ['ghastly X', 'the pale X'],
        3 => ['shadow of X', 'X in silence'],
        4 => ['X of my joy fade', 'X ends the autumn'],
        5 => ['A spark of X above'],
        6 => ['the sad facade of X torn']
      }
    end

    def self.fillers
      {
        5 => ['empty riverside', 'tears flow in the rain', 'cheerful summer\'s charm'],
        7 => ['the vain wind of summer blows', 'gentle breeze upon a mountain', 'a frog jumps into a well']
      }
    end

    attr_reader :ifillers, :cfillers

    def initialize
      @ifillers = FillerLibrary.interpolated_fillers
      @cfillers = FillerLibrary.fillers
    end

    def get_const_filler(filler_length)
      cfillers[filler_length].delete(cfillers[filler_length].sample)
    end

    def get_interpolated_filler(filler_length)
      ifillers[filler_length].delete(ifillers[filler_length].sample)
    end
  end
end
