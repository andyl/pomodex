defmodule PomodexWeb.PeriodLiveTest do
  use PomodexWeb.ConnCase

  import Phoenix.LiveViewTest
  import Pomodex.UsersFixtures

  @create_attrs %{end_at: %{day: 5, hour: 5, minute: 22, month: 1, year: 2022}, note: "some note", seconds: 42, start_at: %{day: 5, hour: 5, minute: 22, month: 1, year: 2022}, status: "some status", tags: "some tags", title: "some title"}
  @update_attrs %{end_at: %{day: 6, hour: 5, minute: 22, month: 1, year: 2022}, note: "some updated note", seconds: 43, start_at: %{day: 6, hour: 5, minute: 22, month: 1, year: 2022}, status: "some updated status", tags: "some updated tags", title: "some updated title"}
  @invalid_attrs %{end_at: %{day: 30, hour: 5, minute: 22, month: 2, year: 2022}, note: nil, seconds: nil, start_at: %{day: 30, hour: 5, minute: 22, month: 2, year: 2022}, status: nil, tags: nil, title: nil}

  defp create_period(_) do
    period = period_fixture()
    %{period: period}
  end

  describe "Index" do
    setup [:create_period]

    test "lists all period", %{conn: conn, period: period} do
      {:ok, _index_live, html} = live(conn, Routes.period_index_path(conn, :index))

      assert html =~ "Listing Period"
      assert html =~ period.note
    end

    test "saves new period", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.period_index_path(conn, :index))

      assert index_live |> element("a", "New Period") |> render_click() =~
               "New Period"

      assert_patch(index_live, Routes.period_index_path(conn, :new))

      assert index_live
             |> form("#period-form", period: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#period-form", period: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.period_index_path(conn, :index))

      assert html =~ "Period created successfully"
      assert html =~ "some note"
    end

    test "updates period in listing", %{conn: conn, period: period} do
      {:ok, index_live, _html} = live(conn, Routes.period_index_path(conn, :index))

      assert index_live |> element("#period-#{period.id} a", "Edit") |> render_click() =~
               "Edit Period"

      assert_patch(index_live, Routes.period_index_path(conn, :edit, period))

      assert index_live
             |> form("#period-form", period: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#period-form", period: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.period_index_path(conn, :index))

      assert html =~ "Period updated successfully"
      assert html =~ "some updated note"
    end

    test "deletes period in listing", %{conn: conn, period: period} do
      {:ok, index_live, _html} = live(conn, Routes.period_index_path(conn, :index))

      assert index_live |> element("#period-#{period.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#period-#{period.id}")
    end
  end

  describe "Show" do
    setup [:create_period]

    test "displays period", %{conn: conn, period: period} do
      {:ok, _show_live, html} = live(conn, Routes.period_show_path(conn, :show, period))

      assert html =~ "Show Period"
      assert html =~ period.note
    end

    test "updates period within modal", %{conn: conn, period: period} do
      {:ok, show_live, _html} = live(conn, Routes.period_show_path(conn, :show, period))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Period"

      assert_patch(show_live, Routes.period_show_path(conn, :edit, period))

      assert show_live
             |> form("#period-form", period: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#period-form", period: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.period_show_path(conn, :show, period))

      assert html =~ "Period updated successfully"
      assert html =~ "some updated note"
    end
  end
end
