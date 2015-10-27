defmodule SubDB do
  @chunk_size 64 * 1024
  def hash(path) do
    File.open! path, [:read], fn file ->
      data_start = IO.binread(file, @chunk_size)
      :file.position(file, {:eof, -@chunk_size})
      data_end = IO.binread(file, @chunk_size)
      Base.encode16(:erlang.md5(data_start <> data_end), case: :lower)
    end
  end
end

System.argv |> Enum.each &(&1 |> SubDB.hash |> IO.puts)
