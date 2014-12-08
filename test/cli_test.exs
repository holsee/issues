defmodule CliTest do
  use ExUnit.Case
  doctest Issues.CLI

  import Issues.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
  end

  test "should return params as tuple when passed 3 args" do
    assert parse_args(["user", "project", 5]) == {"user", "project", 5}
  end

  test "should return default count when passed 2 params" do
    default_count = 4
    assert parse_args(["zomg", "wow"]) == {"zomg", "wow", default_count}
  end

end
