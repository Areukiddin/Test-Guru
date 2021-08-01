class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @badges = Badge.all
    current_test_passage
  end

  def call
    @badges.select { |badge| send(badge.rule, badge.rule_value) }
  end

  private

  def all_category_tests_passed(category)
    return false unless @test.category.title == category

    test_ids = Test.tests_by(category).ids
    test_ids.size == count_tests_success(test_ids)
  end

  def first_try_passed(_args)
    @current_test_passages.count == 1 if @test_passage.success_result?
  end

  def all_level_tests_passed(level)
    return false unless @test.level == level.to_i

    test_ids = Test.where(level: level).ids
    test_ids.size == count_tests_success(test_ids)
  end

  def count_tests_success(test_ids)
    @user.results.where(test_id: test_ids).success_passed.uniq.count
  end

  def current_test_passage
    @current_test_passages = @user.results.where(test: @test)
  end
end
