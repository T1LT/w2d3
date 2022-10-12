class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "invalid pegs"
    end
    @pegs = pegs.map!(&:upcase)
  end

  def self.valid_pegs?(pegs)
    pegs.all? { |el| POSSIBLE_PEGS.keys.include? el.upcase }
  end

  def self.random(length)
    res = Array.new(length, "")
    res.map! { |el| el = POSSIBLE_PEGS.keys.sample }
    Code.new(res)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    (0...length()).each do |idx|
      count += 1 if @pegs[idx] == code[idx]
    end
    count
  end

  def num_near_matches(code)
    codecopy = []
    pegscopy = []
    (0...length()).each do |idx|
      if @pegs[idx] != code[idx]
        codecopy << code[idx]
        pegscopy << @pegs[idx]
      end
    end
    (codecopy & pegscopy).length
  end

  def ==(code)
    return false if code.length != self.length()
    @pegs.each_with_index do |peg, idx|
      return false if code[idx] != peg
    end
    true
  end

end
