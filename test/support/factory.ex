defmodule PhoenixToggl.Factory do
  use ExMachina.Ecto, repo: PhoenixToggl.Repo

  alias PhoenixToggl.{User, Workspace}

  def factory(:user) do
    %User{
      first_name: sequence(:first_name, &"First #{&1}"),
      last_name: sequence(:last_name, &"Last #{&1}"),
      email: sequence(:email, &"email-#{&1}@foo.com"),
      encrypted_password: "12345678"
    }
  end

  def factory(:workspace) do
    %Workspace{
      name: sequence(:name, &"Workspace #{&1}")
    }
  end

  def with_workspace(user) do
    create(:workspace, user_id: user.id)
    user
  end
end
