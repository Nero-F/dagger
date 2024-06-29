# This file generated by `dagger_codegen`. Please DO NOT EDIT.
defmodule Dagger.File do
  @moduledoc "A file."

  use Dagger.Core.QueryBuilder

  @derive Dagger.ID
  @derive Dagger.Sync
  defstruct [:selection, :client]

  @type t() :: %__MODULE__{}

  @doc "Retrieves the contents of the file."
  @spec contents(t()) :: {:ok, String.t()} | {:error, term()}
  def contents(%__MODULE__{} = file) do
    selection =
      file.selection |> select("contents")

    execute(selection, file.client)
  end

  @doc "Writes the file to a file path on the host."
  @spec export(t(), String.t(), [{:allow_parent_dir_path, boolean() | nil}]) ::
          {:ok, String.t()} | {:error, term()}
  def export(%__MODULE__{} = file, path, optional_args \\ []) do
    selection =
      file.selection
      |> select("export")
      |> put_arg("path", path)
      |> maybe_put_arg("allowParentDirPath", optional_args[:allow_parent_dir_path])

    execute(selection, file.client)
  end

  @doc "A unique identifier for this File."
  @spec id(t()) :: {:ok, Dagger.FileID.t()} | {:error, term()}
  def id(%__MODULE__{} = file) do
    selection =
      file.selection |> select("id")

    execute(selection, file.client)
  end

  @doc "Retrieves the name of the file."
  @spec name(t()) :: {:ok, String.t()} | {:error, term()}
  def name(%__MODULE__{} = file) do
    selection =
      file.selection |> select("name")

    execute(selection, file.client)
  end

  @doc "Retrieves the size of the file, in bytes."
  @spec size(t()) :: {:ok, integer()} | {:error, term()}
  def size(%__MODULE__{} = file) do
    selection =
      file.selection |> select("size")

    execute(selection, file.client)
  end

  @doc "Force evaluation in the engine."
  @spec sync(t()) :: {:ok, Dagger.FileID.t()} | {:error, term()}
  def sync(%__MODULE__{} = file) do
    selection =
      file.selection |> select("sync")

    execute(selection, file.client)
  end

  @doc "Retrieves this file with its name set to the given name."
  @spec with_name(t(), String.t()) :: Dagger.File.t()
  def with_name(%__MODULE__{} = file, name) do
    selection =
      file.selection |> select("withName") |> put_arg("name", name)

    %Dagger.File{
      selection: selection,
      client: file.client
    }
  end

  @doc "Retrieves this file with its created/modified timestamps set to the given time."
  @spec with_timestamps(t(), integer()) :: Dagger.File.t()
  def with_timestamps(%__MODULE__{} = file, timestamp) do
    selection =
      file.selection |> select("withTimestamps") |> put_arg("timestamp", timestamp)

    %Dagger.File{
      selection: selection,
      client: file.client
    }
  end
end
