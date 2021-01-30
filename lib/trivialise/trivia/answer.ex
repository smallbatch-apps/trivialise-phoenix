defmodule Trivialise.Trivia.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :answer, :string
    field :correct, :boolean, default: false
    belongs_to :question, Trivialise.Trivia.Question

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:answer, :correct])
    |> validate_required([:answer, :correct])
  end
end
