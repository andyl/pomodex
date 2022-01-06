defmodule PomodexWeb.IntervalLiveTest do
  use PomodexWeb.ConnCase

  import Phoenix.LiveViewTest
  import Pomodex.UsersFixtures

  @create_attrs %{desc: "some desc", hotkey: "some hotkey", name: "some name", position: 42, seconds: 42}
  @update_attrs %{desc: "some updated desc", hotkey: "some updated hotkey", name: "some updated name", position: 43, seconds: 43}
  @invalid_attrs %{desc: nil, hotkey: nil, name: nil, position: nil, seconds: nil}

  defp create_interval(_) do
    interval = interval_fixture()
    %{interval: interval}
  end

  describe "Index" do
    setup [:create_interval]

    test "lists all intervals", %{conn: conn, interval: interval} do
      {:ok, _index_live, html} = live(conn, Routes.interval_index_path(conn, :index))

      assert html =~ "Listing Intervals"
      assert html =~ interval.desc
    end

    test "saves new interval", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.interval_index_path(conn, :index))

      assert index_live |> element("a", "New Interval") |> render_click() =~
               "New Interval"

      assert_patch(index_live, Routes.interval_index_path(conn, :new))

      assert index_live
             |> form("#interval-form", interval: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#interval-form", interval: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.interval_index_path(conn, :index))

      assert html =~ "Interval created successfully"
      assert html =~ "some desc"
    end

    test "updates interval in listing", %{conn: conn, interval: interval} do
      {:ok, index_live, _html} = live(conn, Routes.interval_index_path(conn, :index))

      assert index_live |> element("#interval-#{interval.id} a", "Edit") |> render_click() =~
               "Edit Interval"

      assert_patch(index_live, Routes.interval_index_path(conn, :edit, interval))

      assert index_live
             |> form("#interval-form", interval: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#interval-form", interval: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.interval_index_path(conn, :index))

      assert html =~ "Interval updated successfully"
      assert html =~ "some updated desc"
    end

    test "deletes interval in listing", %{conn: conn, interval: interval} do
      {:ok, index_live, _html} = live(conn, Routes.interval_index_path(conn, :index))

      assert index_live |> element("#interval-#{interval.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#interval-#{interval.id}")
    end
  end

  describe "Show" do
    setup [:create_interval]

    test "displays interval", %{conn: conn, interval: interval} do
      {:ok, _show_live, html} = live(conn, Routes.interval_show_path(conn, :show, interval))

      assert html =~ "Show Interval"
      assert html =~ interval.desc
    end

    test "updates interval within modal", %{conn: conn, interval: interval} do
      {:ok, show_live, _html} = live(conn, Routes.interval_show_path(conn, :show, interval))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Interval"

      assert_patch(show_live, Routes.interval_show_path(conn, :edit, interval))

      assert show_live
             |> form("#interval-form", interval: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#interval-form", interval: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.interval_show_path(conn, :show, interval))

      assert html =~ "Interval updated successfully"
      assert html =~ "some updated desc"
    end
  end
end
