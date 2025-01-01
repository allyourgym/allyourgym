alias Allyourgym.Accounts

defmodule SeedHelper do
  def register_user(attrs) do
    case Accounts.register_user(attrs) do
      {:ok, user} ->
        IO.puts("User #{user.email} created successfully.")
      {:error, changeset} ->
        IO.puts("Failed to create user #{attrs.email}: #{inspect(changeset.errors)}")
    end
  end
end

SeedHelper.register_user(%{
  email: "demo@example.com",
  password: "password12345",
  name: "Demo User 1",
  height: 170.0,
  gender: "male",
  role: :user
})

SeedHelper.register_user(%{
  email: "admin@example.com",
  password: "password12345",
  name: "Admin 1",
  height: 180.0,
  gender: "female",
  role: :admin
})
