headers =
  {"Title",
   {"Chapter 1", {"Subtitle 1", "Subtitle 2"}, "Chapter 2",
    {"Subtitle 1", {"Subsubtitle 1", "Subsubtitle 2", "Subsubtitle 3"}, "Subtitle 2"},
    "Chapter 3"}}

defmodule Format do
  def print_indented(level, text) do
    (String.duplicate(" ", level * 2) <> text) |> IO.puts()
  end

  def print_headers(headers, level \\ -1) do
    if is_binary(headers) do
      print_indented(level, headers)
    else
      Enum.each(Tuple.to_list(headers), &print_headers(&1, level + 1))
    end
  end
end

Format.print_headers(headers)
