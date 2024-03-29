# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RetroGameLog.Repo.insert!(%RetroGameLog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

## Event Logs
case Mix.env() do
  :dev ->
    Seeds.EventLogs.add_event_logs()
    Seeds.Users.add_users()

  _ ->
    :ok
end
