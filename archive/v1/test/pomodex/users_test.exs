defmodule Pomodex.UsersTest do
  use Pomodex.DataCase

  alias Pomodex.Users

  describe "intervals" do
    alias Pomodex.Users.Interval

    import Pomodex.UsersFixtures

    @invalid_attrs %{desc: nil, hotkey: nil, name: nil, position: nil, seconds: nil}

    test "list_intervals/0 returns all intervals" do
      interval = interval_fixture()
      assert Users.list_intervals() == [interval]
    end

    test "get_interval!/1 returns the interval with given id" do
      interval = interval_fixture()
      assert Users.get_interval!(interval.id) == interval
    end

    test "create_interval/1 with valid data creates a interval" do
      valid_attrs = %{desc: "some desc", hotkey: "some hotkey", name: "some name", position: 42, seconds: 42}

      assert {:ok, %Interval{} = interval} = Users.create_interval(valid_attrs)
      assert interval.desc == "some desc"
      assert interval.hotkey == "some hotkey"
      assert interval.name == "some name"
      assert interval.position == 42
      assert interval.seconds == 42
    end

    test "create_interval/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_interval(@invalid_attrs)
    end

    test "update_interval/2 with valid data updates the interval" do
      interval = interval_fixture()
      update_attrs = %{desc: "some updated desc", hotkey: "some updated hotkey", name: "some updated name", position: 43, seconds: 43}

      assert {:ok, %Interval{} = interval} = Users.update_interval(interval, update_attrs)
      assert interval.desc == "some updated desc"
      assert interval.hotkey == "some updated hotkey"
      assert interval.name == "some updated name"
      assert interval.position == 43
      assert interval.seconds == 43
    end

    test "update_interval/2 with invalid data returns error changeset" do
      interval = interval_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_interval(interval, @invalid_attrs)
      assert interval == Users.get_interval!(interval.id)
    end

    test "delete_interval/1 deletes the interval" do
      interval = interval_fixture()
      assert {:ok, %Interval{}} = Users.delete_interval(interval)
      assert_raise Ecto.NoResultsError, fn -> Users.get_interval!(interval.id) end
    end

    test "change_interval/1 returns a interval changeset" do
      interval = interval_fixture()
      assert %Ecto.Changeset{} = Users.change_interval(interval)
    end
  end

  describe "period" do
    alias Pomodex.Users.Period

    import Pomodex.UsersFixtures

    @invalid_attrs %{end_at: nil, note: nil, seconds: nil, start_at: nil, status: nil, tags: nil, title: nil}

    test "list_period/0 returns all period" do
      period = period_fixture()
      assert Users.list_period() == [period]
    end

    test "get_period!/1 returns the period with given id" do
      period = period_fixture()
      assert Users.get_period!(period.id) == period
    end

    test "create_period/1 with valid data creates a period" do
      valid_attrs = %{end_at: ~N[2022-01-05 05:22:00], note: "some note", seconds: 42, start_at: ~N[2022-01-05 05:22:00], status: "some status", tags: "some tags", title: "some title"}

      assert {:ok, %Period{} = period} = Users.create_period(valid_attrs)
      assert period.end_at == ~N[2022-01-05 05:22:00]
      assert period.note == "some note"
      assert period.seconds == 42
      assert period.start_at == ~N[2022-01-05 05:22:00]
      assert period.status == "some status"
      assert period.tags == "some tags"
      assert period.title == "some title"
    end

    test "create_period/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_period(@invalid_attrs)
    end

    test "update_period/2 with valid data updates the period" do
      period = period_fixture()
      update_attrs = %{end_at: ~N[2022-01-06 05:22:00], note: "some updated note", seconds: 43, start_at: ~N[2022-01-06 05:22:00], status: "some updated status", tags: "some updated tags", title: "some updated title"}

      assert {:ok, %Period{} = period} = Users.update_period(period, update_attrs)
      assert period.end_at == ~N[2022-01-06 05:22:00]
      assert period.note == "some updated note"
      assert period.seconds == 43
      assert period.start_at == ~N[2022-01-06 05:22:00]
      assert period.status == "some updated status"
      assert period.tags == "some updated tags"
      assert period.title == "some updated title"
    end

    test "update_period/2 with invalid data returns error changeset" do
      period = period_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_period(period, @invalid_attrs)
      assert period == Users.get_period!(period.id)
    end

    test "delete_period/1 deletes the period" do
      period = period_fixture()
      assert {:ok, %Period{}} = Users.delete_period(period)
      assert_raise Ecto.NoResultsError, fn -> Users.get_period!(period.id) end
    end

    test "change_period/1 returns a period changeset" do
      period = period_fixture()
      assert %Ecto.Changeset{} = Users.change_period(period)
    end
  end
end
