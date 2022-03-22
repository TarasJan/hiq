# frozen_string_literal: true

require 'hiq/version'
require 'hiq/syllabizable'
require 'hiq/exceptions'
require 'hiq/domain/word_checker'
require 'hiq/domain/filler_library'
require 'hiq/domain/line_composer'
require 'hiq/haiku'

# haiku main module
module Hiq
  def self.haiku(*words)
    Haiku.new(words).to_s
  end
end
