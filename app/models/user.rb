class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :results, inverse_of: :user, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :own_badges, inverse_of: :user, dependent: :destroy
  has_many :badges, through: :own_badges

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9+\-_.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'invalid format' }

  def results_list_by(level)
    Test.joins(:results)
        .where(results: { user_id: id }, level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

  def add_category_badge(test_passage)
    badges.push(Badge.where(achieved_for: Badge.category_badge_kind(test_passage.test))) if all_category_tests_passed?(test_passage)
  end

  def add_level_badge(test_passage)
    badges.push(Badge.where(achieved_for: Badge.level_badge_kind(test_passage.test))) if all_level_tests_passed?(test_passage)
  end

  def add_first_try_badge(test_passage)
    badges.push(Badge.where(achieved_for: 'Successfully first try test passed')) if first_try_success?(test_passage)
  end

  private

  def passed_tests_by_category(category)
    results.select { |r| r.success_result? && r.test.category.eql?(category) }.pluck(:test_id).uniq
  end

  def all_category_tests_passed?(test_passage)
    Test.tests_by(test_passage.test.category.title).eql?(passed_tests_by_category(test_passage.test.category))
  end

  def first_try_success?(test_passage)
    results.where(test: test_passage.test).select(&:success_result?).count.eql?(1)
  end

  def all_level_tests_passed?(test_passage)
    results.select { |r| r.success_result? && r.test.level.eql?(test_passage.test.level) }.pluck(:test_id).uniq.count.eql?(Test.easy.count)
  end
end
