defmodule AllyourgymWeb.UserLive do
  use Backpex.LiveResource,
    adapter_config: [
      schema: Allyourgym.Accounts.User,
      repo: Allyourgym.Repo,
      update_changeset: &Allyourgym.Accounts.User.update_changeset/3,
      create_changeset: &Allyourgym.Accounts.User.create_changeset/3
    ],
    layout: {AllyourgymWeb.Layouts, :admin},
    pubsub: [
      name: Allyourgym.PubSub,
      topic: "users",
      event_prefix: "users_"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "User"

  @impl Backpex.LiveResource
  def plural_name, do: "Users"

  @impl Backpex.LiveResource
  def fields do
    [
      name: %{
        module: Backpex.Fields.Text,
        label: "Name",
        searchable: true
      },
      email: %{
        module: Backpex.Fields.Text,
        label: "Email",
        searchable: true
      },
      role: %{
        module: Backpex.Fields.Select,
        label: "Role",
        options: [
          {"Admin", :admin},
          {"User", :user}
        ]
      },
      height: %{
        module: Backpex.Fields.Number,
        label: "Height"
      },
      gender: %{
        module: Backpex.Fields.Select,
        label: "Gender",
        options: [
          {"Male", "male"},
          {"Female", "female"}
        ]
      }
    ]
  end
end
