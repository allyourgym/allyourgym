defmodule AllyourgymWeb.WorkoutLive do
  use Backpex.LiveResource,
    adapter_config: [
      schema: Allyourgym.Fitness.Workout,
      repo: Allyourgym.Repo,
      update_changeset: &Allyourgym.Fitness.Workout.update_changeset/3,
      create_changeset: &Allyourgym.Fitness.Workout.create_changeset/3
    ],
    layout: {AllyourgymWeb.Layouts, :admin},
    pubsub: [
      name: Allyourgym.PubSub,
      topic: "workouts",
      event_prefix: "workouts"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "Workout"

  @impl Backpex.LiveResource
  def plural_name, do: "Workouts"

  @impl Backpex.LiveResource
  def fields do
    [
      name: %{
        module: Backpex.Fields.Text,
        label: "Name"
      },
      description: %{
        module: Backpex.Fields.Text,
        label: "Description"
      },
      is_public: %{
        module: Backpex.Fields.Boolean,
        label: "Public"
      },
      notes: %{
        module: Backpex.Fields.Text,
        label: "Notes"
      },
      is_prebuilt: %{
        module: Backpex.Fields.Boolean,
        label: "Prebuilt"
      },
      created_by: %{
        module: Backpex.Fields.BelongsTo,
        label: "Created by",
        display_field: :email,
        live_resource: AllyourgymWeb.UserLive
      },
      # exercises: %{
      #   module: Backpex.Fields.HasMany,
      #   label: "Exercises",
      #   display_field: :name,
      #   live_resource: AllyourgymWeb.ExerciseLive,
      # }
      # exercises: %{
      #   module: Backpex.Fields.HasManyOrderable,
      #   label: "Exercises",
      #   order_field: :position,
      #   order_direction: :asc,
      #   display_field: :name,
      #   live_resource: AllyourgymWeb.ExerciseLive,
      # }

      exercises: %{
        module: Backpex.Fields.HasManyThrough,
        label: "Exercises",
        except: [:index],
        # display_field: :exercise,
        display_field: :name,
        live_resource: AllyourgymWeb.ExerciseLive,
        # sort_by: [:position],
        sort_by: [:name],
        orderable: true,
        searchable: true,
        pivot_fields: [
          position: %{
            module: Backpex.Fields.Number,
            label: "Position"
          },
          # exercise: %{
          #   module: Backpex.Fields.Select,
          #   # module: Backpex.Fields.Text,
          #   label: "Name",
          # }
        ],
        # options_query: fn query, _assigns ->
        #   select_merge(
        #     query,
        #     [a],
        #     %{eee: fragment("concat(?, ', ', ?)", a.name, a.muscle_group)}
        #   )
        # end
        }
    ]
  end
end
