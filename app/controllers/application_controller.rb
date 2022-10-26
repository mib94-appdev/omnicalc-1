class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb"})
  end 
  
  def calculate_square

    @num = params.fetch("elephant").to_f
    @square_of_num = @num * @num

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_random

    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_square_root

    render({ :template => "calculation_templates/sqrt_form.html.erb"})
  end

  def calculate_square_root
    @numb = params.fetch("square_root").to_f
    @sqrt_of_numb = @numb ** 0.5

    render({ :template => "calculation_templates/sqrt_results.html.erb"})
  end

  def blank_payment

    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f / 100
    @years = params.fetch("user_years").to_f
    @n = @years * 12
    @principal = params.fetch("user_principal").to_f
    @r = @apr / 12
    @numerator = @r * @principal
    @denominator = 1 - (1/(1 + @r))**(@n)
    @payment = @numerator / @denominator

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end
