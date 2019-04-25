defmodule CardsTwo do
  def create_deck do
    values = ["One", "Two", "Three", "Four", "Five", "Six"]
    faces = ["Spades", "Hearts", "Diamonds", "Clubs"]

    for face <- faces, value <- values, into: %{} do
      {{face, value}, "#{value} of #{face}"}
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, number_of_cards) do
    Enum.split(deck, number_of_cards)
  end

  def contains?(hand, card) do
    Enum.member?(hand, card)
  end

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)
    File.write!(fileName, binary)
  end

  def load(fileName) do
    case File.read(fileName) do
      {:ok, file} -> file
      {:error, _reason} -> "No such file exists"
    end
  end

  def deal(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end

  def thing(value \\ "none")
  # def thing do
  #   IO.puts("none")
  # end

  def thing(:one) do
    IO.puts("one")
  end

  def thing(:two) do
    IO.puts("two")
  end

  def thing(:three) do
    IO.puts("three")
  end

  def thing(value) do
    IO.puts(value)
  end
end
