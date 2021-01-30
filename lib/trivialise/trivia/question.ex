defmodule Trivialise.Trivia.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :points, :integer
    field :question, :string
    field :type, :integer
    has_many :answers, Trivialise.Trivia.Answer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :points, :type])
    |> validate_required([:question, :points, :type])
  end
end
