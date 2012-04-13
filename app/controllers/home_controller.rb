class HomeController < ApplicationController
  def index
    @problems = Problem.all
  end
end
