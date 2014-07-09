class NormalSV

  attr_accessor :me, :disp, :sv, :m, :s

  def initialize(m, s)
    @sv = []
    @m = m
    @s = s
    @me = m
    @disp = s**2
    generation_sv
  end

  def generation_sv
    file = File.new("out_normal_sv.txt", "w")

    1000.times do |line_number|
      bsv = rand
      if bsv <= 0.5
        x = - fi_1(bsv + 0.5).round(4)
      else
        x = fi_1(bsv).round(4)
      end

      x = x * @s + @m.to_f
      @sv << x
      file << "#{line_number}: #{x}\n"
    end

    file.close
  end

  def fi_1(z)
    z = tetta(z)
    pol1 = 2.515517 + 0.802853*z + 0.01328*z*z
    pol2 = 1.0 + 1.432788*z + 0.189269*z*z +0.001308*z*z*z
    (pol1 / pol2).to_f - z
  end

  def tetta(z)
    Math.sqrt(-2.0 * Math.log(z))
  end
end