# Allyourgym

An opensource web app written in Elixir using the Phoenix framework.
You can view, create and customize workouts for sliding board trainers like the total gym.

Features an admin dashboard to examine users, workouts and exercises as well as edit and create them.

## Documentation Pages
https://allyourgym.github.io/allyourgym/


## Running Locally
A script is included to create a docker container to run the app as well as a docker container to run postgresql in a container.

Start it like so:

```
sudo chmod +x setup.sh
./setup.sh
```

Then visit http://localhost:4000 in your browser.

The postgres data is persisted in the `pgdata_dev` dir.