defmodule LibraryFees do
  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, naive_datetime} ->
        naive_datetime
      {:error, reason} ->
        IO.puts "Error converting: #{reason}"
    end
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    noon = ~T[12:00:00]
    Time.before?(time, noon)
  end

  def return_date(checkout_datetime) do
    days_to_return =
      case before_noon?(checkout_datetime) do
        true -> 28
        false -> 29
      end

    NaiveDateTime.add(checkout_datetime, days_to_return, :day) 
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    cond do
      Date.before?(actual_return_date, planned_return_date) -> 0
      true -> Date.diff(actual_return_date, planned_return_date)
    end
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    Date.day_of_week(date) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)
    planned_return_date = return_date(checkout_datetime)
    cost =
      case monday?(actual_return_datetime) do
        true -> trunc(days_late(planned_return_date, actual_return_datetime) * rate * 0.5)
        false -> days_late(planned_return_date, actual_return_datetime) * rate
      end
  end
end
