# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength

module Hiq
  # Provided of filler for lines of haiku
  class FillerLibrary
    def self.interpolated_fillers
      {
        1 => ['the X', 'a X', 'X house!'],
        2 => ['ghastly X', 'the pale X', 'fog X mince', 'No X jay', 'X the bottle', 'younger X', 'X bark tight',
              'with a X winds'],
        3 => ['shadow of X', 'X in silence', 'the subway X', 'In the pink X', 'behind an X', 'it bus X moon',
              'X the pages'],
        4 => ['X of my joy fade', 'X ends the autumn', 'letter to the X', 'X in the window', 'the lines of X',
              'the X scattered', 'flat fine go X call', 'from the childhood X'],
        5 => ['A spark of X above', 'Slayer wind the way X'],
        6 => ['the sad facade of X torn', 'afternoon from I wall X', 'X trees flutter over back ']
      }
    end

    def self.fillers
      {
        5 => [
          'empty riverside',
          'tears flow in the rain',
          'cheerful summer\'s charm',
          'A fallen leaves',
          "New Year's 1ever",
          'of a dog hanged',
          'on the pavement',
          "Valentine's Day",
          'a shadow boating',
          'airily balloons -',
          'cup on tea music',
          'evening coolness',
          'finally ad bass -',
          'override my amps',
          'A head lit shelter',
          'a bark flower pot',
          'and there escapes',
          'fan into too fast',
          'in the holy sense',
          'inside the sunset',
          'listening to down',
          'on a bird fingers',
          'the bag of autumn',
          'the bay of a dart',
          'the colored world',
          'after the pumpkin:',
          'at the sudden hair',
          'autumn leaf flames',
          'comes to an end...',
          'for the sun alone',
          'in the young weirs',
          'on a garbage truck',
          'snow fall of roses',
          'the saddled slower',
          'a wash before sheep',
          'affords hot the air',
          'in the Honkers mine',
          'in the fall flowing',
          'milk in the morning',
          'someone older bloom',
          'the ash leaves splay',
          'the lift of a moor,',
          'the same quiet rains',
          '- A hole in the rise',
          'October wind through',
          'headlights, whiter-et',
          'i- two gold her hair',
          'just up kin oil beard',
          'passing my neighbor',
          'pierce drippy second',
          'shells in the mirror',
          'the sound of a trash',
          'the wild powder sack',
          'the mister rams trap',
          'from the first baleen',
          'my mind like a candle',
          'snow, leaves two pies',
          'the scent of red hair',
          'a flank of calm mosque',
          'a fan a across',
          "sin's that dawn light tide"
        ],
        7 => [
          'the vain wind of summer blows',
          'gentle breeze upon a mountain',
          'a frog jumps into a well',
          'around my of finally',
          'roses in the forecast',
          'follow just overflowed',
          'of a traveling machine',
          'of allowed in the blade',
          'under a clamping lilac -',
          'on the Pony.. and snuffer',
          'the blinded on a red road',
          'the scent of lemon petals',
          'the islands in the grab use',
          'the noise of a carrier bag',
          'young women clean morning -',
          'an expecting moon His breaks',
          'the boyfriend of my pocket -',
          'Spring warding stray or a glass',
          'and two pour face all the dock',
          'i wish i X on buy band train',
          'in the fresh of old plane candle',
          "we're down the school of her hands"
        ]
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
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
