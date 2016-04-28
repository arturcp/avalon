module Characters
  class Character
    GOOD_ALIGNMENT = 'good'
    EVIL_ALIGNMENT = 'evil'

    def good?
      @alignment == GOOD_ALIGNMENT
    end

    def evil?
      @alignment == EVIL_ALIGNMENT
    end

    def name
      @name
    end
  end
end
