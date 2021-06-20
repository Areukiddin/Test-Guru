class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy update edit start]
  before_action :find_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = User.first.created_tests.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def start
    @user.tests.delete(@test) if @user.tests.include?(@test)
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end
end
