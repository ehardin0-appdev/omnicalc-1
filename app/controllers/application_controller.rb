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

  def random_results
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end
end
