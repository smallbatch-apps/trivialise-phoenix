defmodule Trivialise.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :points, :integer
      add :type, :integer

      timestamps()
    end

  end
end
