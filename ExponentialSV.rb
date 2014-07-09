class ExponentialSV

  attr_accessor :sv, :a, :me, :disp

  def initialize(a)
    @sv = []
    @a = a
    @me = 1/a.to_f
    @disp = 1/(a**2).to_f
    generation_sv
  end

  def generation_sv
    file = File.new("out_exponential_sv.txt", "w")

    1000.times do |line_number|
      bsv = rand
      x = - (1 / @a.to_f) * Math.log(bsv)
      x = x.round(4)
      @sv << x
      file << "#{line_number}: #{x}\n"
    end

    file.close
  end

end