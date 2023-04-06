class ApplicationController < ActionController::Base

  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def square_results
    # params = {"number"=>"12"}
    @num = params.fetch("number").to_f

    @square_of_num = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def random_new
    render ({ :template => "calculation_templates/random_new.html.erb"})
  end

  def random_results
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_new.html.erb"})
  end

  def square_root_results
    @num = params.fetch("number").to_f

    @square_root_of_num = @num ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def payment_new
    render({ :template => "calculation_templates/payment_new.html.erb"})
  end

  def payment_results
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_f
    @pv = params.fetch("principal").to_f

    @n = @years * 12
    @r = @apr / (100 * 12)

    @numerator = @r * @pv
    @denominator = 1 - ((1 + @r) ** (@n * -1))
    @payment = @numerator / @denominator
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end
