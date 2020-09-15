module StringRefinement
  REPLACE_CHARACTERS ||= [' ', '/'].freeze
  private_constant :REPLACE_CHARACTERS

  refine String do
    def underscorize
      REPLACE_CHARACTERS.reduce(self.downcase) do |acc, char|
        acc.tr(char, '_')
      end
    end
  end
end
