defmodule Trivialise.AnswerController do
  use TrivialiseWeb, :controller

  alias Trivialise.Trivia

  def create(conn, %{"question_id" => question_id, "answer" => answer_params}) do
    question = Trivia.get_question!(question_id)

    case Trivia.create_answer(question, answer_params) do
      {:ok, _answer} ->
        conn
        |> put_flash(:info, "Answer created successfully")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Issue creating answer")
        |> redirect(to: Routes.question_path(conn, :show, question))
    end
  end
end
