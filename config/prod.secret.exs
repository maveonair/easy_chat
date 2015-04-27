use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :easy_chat, EasyChat.Endpoint,
  secret_key_base: "L/YyW3dlr8aGKmbWkG9Hc49EXCxyRKGlgdJEMMRfTszeIkNGwomlRDw5/a/Z91hG"

# Configure your database
config :easy_chat, EasyChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "easy_chat_prod"
