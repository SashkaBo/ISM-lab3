class BetaSV

  attr_accessor :v, :w, :sv, :me, :disp

  def initialize(v, w)
    @sv = []
    @v = v
    @w = w
    @me = me
    @disp = disp
    generation_sv
  end

  def generation_sv
    file = File.new("out_beta_sv.txt", "w")


    1000.times do |line_number|
      gamma1 = generate_gamma_sv(@v)
      gamma2 = generate_gamma_sv(@w)
      x = gamma1 / (gamma1 + gamma2).to_f
      x = x.round(4)
      @sv << x
      file << "#{line_number}: #{x}\n"
    end

    file.close
  end

  def generate_gamma_sv(b)
    bsv = 1.0
    b.times do
      bsv *=  rand
    end
    - (Math.log(bsv))
  end

  def me
    (@v / (@v + @w).to_f).round(4)
  end

  def disp
    denominator = (@v + @w) * (@v + @w) * (@v + @w + 1)
    (@v * @w / denominator.to_f).round(4)
  end

end