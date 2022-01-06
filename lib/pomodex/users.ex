defmodule Pomodex.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Pomodex.Repo

  alias Pomodex.Users.Interval

  @doc """
  Returns the list of intervals.

  ## Examples

      iex> list_intervals()
      [%Interval{}, ...]

  """
  def list_intervals do
    Repo.all(Interval)
  end

  @doc """
  Gets a single interval.

  Raises `Ecto.NoResultsError` if the Interval does not exist.

  ## Examples

      iex> get_interval!(123)
      %Interval{}

      iex> get_interval!(456)
      ** (Ecto.NoResultsError)

  """
  def get_interval!(id), do: Repo.get!(Interval, id)

  @doc """
  Creates a interval.

  ## Examples

      iex> create_interval(%{field: value})
      {:ok, %Interval{}}

      iex> create_interval(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_interval(attrs \\ %{}) do
    %Interval{}
    |> Interval.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a interval.

  ## Examples

      iex> update_interval(interval, %{field: new_value})
      {:ok, %Interval{}}

      iex> update_interval(interval, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_interval(%Interval{} = interval, attrs) do
    interval
    |> Interval.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a interval.

  ## Examples

      iex> delete_interval(interval)
      {:ok, %Interval{}}

      iex> delete_interval(interval)
      {:error, %Ecto.Changeset{}}

  """
  def delete_interval(%Interval{} = interval) do
    Repo.delete(interval)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking interval changes.

  ## Examples

      iex> change_interval(interval)
      %Ecto.Changeset{data: %Interval{}}

  """
  def change_interval(%Interval{} = interval, attrs \\ %{}) do
    Interval.changeset(interval, attrs)
  end

  alias Pomodex.Users.Period

  @doc """
  Returns the list of period.

  ## Examples

      iex> list_period()
      [%Period{}, ...]

  """
  def list_period do
    Repo.all(Period)
  end

  @doc """
  Gets a single period.

  Raises `Ecto.NoResultsError` if the Period does not exist.

  ## Examples

      iex> get_period!(123)
      %Period{}

      iex> get_period!(456)
      ** (Ecto.NoResultsError)

  """
  def get_period!(id), do: Repo.get!(Period, id)

  @doc """
  Creates a period.

  ## Examples

      iex> create_period(%{field: value})
      {:ok, %Period{}}

      iex> create_period(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_period(attrs \\ %{}) do
    %Period{}
    |> Period.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a period.

  ## Examples

      iex> update_period(period, %{field: new_value})
      {:ok, %Period{}}

      iex> update_period(period, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_period(%Period{} = period, attrs) do
    period
    |> Period.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a period.

  ## Examples

      iex> delete_period(period)
      {:ok, %Period{}}

      iex> delete_period(period)
      {:error, %Ecto.Changeset{}}

  """
  def delete_period(%Period{} = period) do
    Repo.delete(period)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking period changes.

  ## Examples

      iex> change_period(period)
      %Ecto.Changeset{data: %Period{}}

  """
  def change_period(%Period{} = period, attrs \\ %{}) do
    Period.changeset(period, attrs)
  end
end
