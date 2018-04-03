class Api::BenchesController < ApplicationController

  def index
    sleep(2);
    @benches = Bench.all
    render 'api/benches/index'
  end

  def create

  end

end
