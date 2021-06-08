class TestsController < ApplicationController
  def index
    tests = Test.pluck(:title)

    render plain: tests.join("\n")
  end
end
