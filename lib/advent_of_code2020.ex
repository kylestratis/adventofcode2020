defmodule AdventOfCode2020 do
  @moduledoc """
  Elixir solutions for `AdventOfCode2020`.
  """

  defp day1_process(filename) do
    File.read!(Path.absname(filename)) 
    |> String.split("\n", trim: true) 
    |> Enum.map(&String.to_integer/1) 
    |> Enum.filter(&(&1 < 2020))
  end

  @doc """
  Advent of Code day 1 solution

  ## Examples
      iex> AdventOfCode2020.day1()
  """
  def day1 do
    input = day1_process("lib/day_one_input.txt")
    Enum.map(input, &(2020 - &1)) 
    |> Enum.filter(fn x -> Enum.member?(input, x) end) 
    |> Enum.reduce(&(&1 * &2))
    
  end

  """
  def day1(list, num) do
    Enum.map(list, &(num - &1))
    |> Enum.filter(fn x -> Enum.member?(list, x) end)
    |> &(!Enum.empty? &1)
  end

  @doc
  Like day1, but with 2 complements
  
  def day1_pt2 do
    input = day1_process("lib/day_one_input.txt")
    z = Enum.map(input, &(2020 - &1)) 
        |> Enum.filter(fn x -> day1(input, x) end)
        |> Enum.reduce(&(&1 * &2 * &3))

  end
  """

  @doc """
  Advent of Code day 2 solution
  """
  def day2 do
    input = File.read!(Path.absname("lib/day_two_input.txt"))
            |> String.split("\n", trim: true)
            |> Enum.count(&(day2_helper(&1) == true)) 
  end
  
  defp day2_helper(s) do
    split = String.split(s, ~r/-|:|\s/, trim: :ok)
    letter = Enum.at(split, 2)
    min = Enum.at(split, 0)
          |> String.to_integer
    max = Enum.at(split, 1)
          |> String.to_integer
    count = Enum.at(split, 3)
            |> String.graphemes
            |> Enum.count(&(&1 == letter))
    if count >= min && count <= max do
      true
    else
      false
    end
  end
end
