defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixir holsee@gmail.com" }]

  def fetch(user, project) do
    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  defp issues_url(user, project), 
    do: "https://api.github.com/repos/#{user}/#{project}/issues"

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), 
    do: {:ok, body}

  defp handle_response({:ok, %HTTPoison.Response{status_code: status_code}}), 
    do: {:error, "status code: #{status_code}"}

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}), 
    do: {:error, reason}

end