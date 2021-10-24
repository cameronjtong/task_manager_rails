require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Cameron",
      email: "cameron.tong2b@gmail.com",
      password: "foobar",
      password_digest: "foobar"
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be valid without name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "not valid without email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "not valid with duplicate email" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "invalid email format" do
    invalid_addresses = %w[foo@foo invalid@foo12. cameron@foo@.com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
  end

  test "valid email format" do
    valid_addresses = %w[cameron@gmail.com arianne_1@gmail.com adrian@adrian.com]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?
    end
  end
end
