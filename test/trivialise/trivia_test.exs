defmodule Trivialise.TriviaTest do
  use Trivialise.DataCase

  alias Trivialise.Trivia

  describe "questions" do
    alias Trivialise.Trivia.Question

    @valid_attrs %{points: 42, question: "some question", type: 42}
    @update_attrs %{points: 43, question: "some updated question", type: 43}
    @invalid_attrs %{points: nil, question: nil, type: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trivia.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Trivia.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Trivia.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Trivia.create_question(@valid_attrs)
      assert question.points == 42
      assert question.question == "some question"
      assert question.type == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trivia.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Trivia.update_question(question, @update_attrs)
      assert question.points == 43
      assert question.question == "some updated question"
      assert question.type == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Trivia.update_question(question, @invalid_attrs)
      assert question == Trivia.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Trivia.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Trivia.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Trivia.change_question(question)
    end
  end

  describe "answers" do
    alias Trivialise.Trivia.Answer

    @valid_attrs %{answer: "some answer", correct: true}
    @update_attrs %{answer: "some updated answer", correct: false}
    @invalid_attrs %{answer: nil, correct: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trivia.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Trivia.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Trivia.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Trivia.create_answer(@valid_attrs)
      assert answer.answer == "some answer"
      assert answer.correct == true
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trivia.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{} = answer} = Trivia.update_answer(answer, @update_attrs)
      assert answer.answer == "some updated answer"
      assert answer.correct == false
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Trivia.update_answer(answer, @invalid_attrs)
      assert answer == Trivia.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Trivia.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Trivia.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Trivia.change_answer(answer)
    end
  end
end
