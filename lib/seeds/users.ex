defmodule Seeds.Users do
  alias RetroGameLog.Accounts

  def create_faker_data() do
    Enum.map(1..25, fn _ ->
      email = "#{Faker.Person.first_name()}.#{Faker.Person.last_name()}@example.com"
      %{email: email, password: Faker.Beer.name()}
    end)
  end

  def add_users(), do: Enum.each(create_faker_data(), &Accounts.create_user/1)
end
