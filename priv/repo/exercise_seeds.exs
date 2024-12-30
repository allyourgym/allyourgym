# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Allyourgym.Repo.insert!(%Allyourgym.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Allyourgym.Repo
alias Allyourgym.Fitness.Exercise

exercises =
[
  %{
    name: "Seated Chest Press – Shoulder Width Grip",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=oc-013nTNtY&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=1&pp=iAQB",
    illustration_card_number: 1,
    muscle_group: "Chest"
  },
  %{
    name: "Seated Chest Press – Wide Grip",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=oc-013nTNtY&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=1&pp=iAQB",
    illustration_card_number: 2,
    muscle_group: "Chest"
  },
  %{
    name: "Seated Chest Fly",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=z7tWjWXy5y8&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=2&pp=iAQB",
    illustration_card_number: 3,
    muscle_group: "Chest"
  },
  %{
    name: "Seated Chest Fly – Incline & Decline",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=z7tWjWXy5y8&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=2&pp=iAQB",
    illustration_card_number: 4,
    muscle_group: "Chest"
  },
  %{
    name: "Incline Push Up",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=OCx_lSJx_C4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=3&pp=iAQB",
    illustration_card_number: 5,
    muscle_group: "Chest"
  },
  %{
    name: "Lateral Chest Fly",
    notes: "Exercise focusing on chest muscles.",
    youtube_link: "https://www.youtube.com/watch?v=HdobJkGvnnw&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=4&pp=iAQB",
    illustration_card_number: 6,
    muscle_group: "Chest"
  },
  %{
    name: "Pull-Up",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=psuwp4hWFeo&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=5&pp=iAQB",
    illustration_card_number: 7,
    muscle_group: "Back"
  },
  %{
    name: "Chin-Up",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=HJxbPzFsVDk&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=6&pp=iAQB",
    illustration_card_number: 8,
    muscle_group: "Back"
  },
  %{
    name: "Front Pullover",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=O1qR1--6keY&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=7&pp=iAQB",
    illustration_card_number: 10,
    muscle_group: "Back"
  },
  %{
    name: "Seated Row",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=E_w2_X6tIDo&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=8&pp=iAQB",
    illustration_card_number: 11,
    muscle_group: "Back"
  },
  %{
    name: "Kneeling Row",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=E_w2_X6tIDo&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=8&pp=iAQB",
    illustration_card_number: 17,
    muscle_group: "Back"
  },
  %{
    name: "Iron Cross/Snow Angel",
    notes: "Exercise focusing on back muscles.",
    youtube_link: "https://www.youtube.com/watch?v=vjXpBcOiYqc&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=9&pp=iAQB",
    illustration_card_number: 12,
    muscle_group: "Back"
  },
  %{
    name: "Inverted Iron Cross/Snow Angel",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=H8E-OGF4VVc&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=10&pp=iAQB",
    illustration_card_number: 18,
    muscle_group: "Shoulders"
  },
  %{
    name: "Shoulder Press",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=3b83nBJ1CZI&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=11&pp=iAQB",
    illustration_card_number: 19,
    muscle_group: "Shoulders"
  },
  %{
    name: "Upright Row",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=jTDyLKobSAo&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=12&pp=iAQB",
    illustration_card_number: 20,
    muscle_group: "Shoulders"
  },
  %{
    name: "Front Deltoid Raise",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=U9xzUPbul4M&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=13&pp=iAQB",
    illustration_card_number: 21,
    muscle_group: "Shoulders"
  },
  %{
    name: "Shoulder Extension",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=BFw0zYXgg2c&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=14&pp=iAQB",
    illustration_card_number: 22,
    muscle_group: "Shoulders"
  },
  %{
    name: "Front Raise",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=zb-LlBmIEUQ&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=15&pp=iAQB",
    illustration_card_number: 23,
    muscle_group: "Shoulders"
  },
  %{
    name: "Serve",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=QoyOxhkEX8A&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=16&pp=iAQB",
    illustration_card_number: 24,
    muscle_group: "Shoulders"
  },
  %{
    name: "Inverted Front Raise",
    notes: "Exercise focusing on shoulders muscles.",
    youtube_link: "https://www.youtube.com/watch?v=X6ilKiyS5LU&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=17&pp=iAQB",
    illustration_card_number: 25,
    muscle_group: "Shoulders"
  },
  %{
    name: "Leg Curl – Lying or Seated",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ilh9eOZjrsg&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=18&pp=iAQB",
    illustration_card_number: 26,
    muscle_group: "Legs"
  },
  %{
    name: "Squat",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=jqpxHxf8Wpc&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=19&pp=iAQB",
    illustration_card_number: 27,
    muscle_group: "Legs"
  },
  %{
    name: "Twisting Squat",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Qckt0zIGUfA&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=20&pp=iAQB",
    illustration_card_number: 28,
    muscle_group: "Legs"
  },
  %{
    name: "Single Leg Squat",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=kObCDo0UduE&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=21&pp=iAQB",
    illustration_card_number: 29,
    muscle_group: "Legs"
  },
  %{
    name: "Outer Hip & Thigh",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=8NWpGgAvlwk&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=23&pp=iAQB",
    illustration_card_number: 33,
    muscle_group: "Legs"
  },
  %{
    name: "Side Squat",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=5GRJj2DJ2Uo&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=24&pp=iAQB",
    illustration_card_number: 34,
    muscle_group: "Legs"
  },
  %{
    name: "Jumping Squat | Total Gym Exercises",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=_0lEHkYOC6o&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=25&pp=iAQB",
    illustration_card_number: 35,
    muscle_group: "Legs"
  },
  %{
    name: "Skiing",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Qckt0zIGUfA&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=20&pp=iAQB",
    illustration_card_number: 36,
    muscle_group: "Legs"
  },
  %{
    name: "Sprinter Squat",
    notes: "Exercise focusing on legs muscles.",
    youtube_link: "https://www.youtube.com/watch?v=1TnyybkLqoI&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=26&pp=iAQB",
    illustration_card_number: 39,
    muscle_group: "Legs"
  },
  %{
    name: "Seated Bicep Curl",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=byQ4Wr-74Xg&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=28&pp=iAQB",
    illustration_card_number: 43,
    muscle_group: "Arms"
  },
  %{
    name: "Lying Triceps",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=2OqlFwNhEWE&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=29&pp=iAQB",
    illustration_card_number: 44,
    muscle_group: "Arms"
  },
  %{
    name: "Lying Triceps Extension",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=_ymUR9Spn_4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=30&pp=iAQB",
    illustration_card_number: 45,
    muscle_group: "Arms"
  },
  %{
    name: "Inverted Biceps Curl",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Njjx6URkUyc&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=31&pp=iAQB",
    illustration_card_number: 46,
    muscle_group: "Arms"
  },
  %{
    name: "Kneeling  Triceps Kickback",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=2OqlFwNhEWE&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=29&pp=iAQB",
    illustration_card_number: 48,
    muscle_group: "Arms"
  },
  %{
    name: "Lateral Biceps Curl",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ISz1cpJNmvE&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=32&pp=iAQB",
    illustration_card_number: 49,
    muscle_group: "Arms"
  },
  %{
    name: "Lateral Triceps Extension",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=uiEVQcQovJs&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=33&pp=iAQB",
    illustration_card_number: 50,
    muscle_group: "Arms"
  },
  %{
    name: "Lateral Arm Pull",
    notes: "Exercise focusing on arms muscles.",
    youtube_link: "https://www.youtube.com/watch?v=uiEVQcQovJs&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=33&pp=iAQB",
    illustration_card_number: 51,
    muscle_group: "Arms"
  },
  %{
    name: "Sit-Up",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=OJVorH2WD2w&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=34&pp=iAQB",
    illustration_card_number: 52,
    muscle_group: "Compound"
  },
  %{
    name: "Sit-Up With Cables",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=i25vcSZHA54&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=35&pp=iAQB",
    illustration_card_number: 53,
    muscle_group: "Compound"
  },
  %{
    name: "Oblique Twister",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=tZsH-mzXJbY&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=36&pp=iAQB",
    illustration_card_number: 54,
    muscle_group: "Compound"
  },
  %{
    name: "Crunches",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ZAChGGBCfv0&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=37&pp=iAQB",
    illustration_card_number: 55,
    muscle_group: "Compound"
  },
  %{
    name: "Kneeling Plank Press",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=nNbWpO1VqtQ&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=38&pp=iAQB",
    illustration_card_number: 59,
    muscle_group: "Compound"
  },
  %{
    name: "Inverted Crunch",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=RCnpsA84tek&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=39&pp=iAQB",
    illustration_card_number: 61,
    muscle_group: "Compound"
  },
  %{
    name: "Arm Pulldown (Standing Aerobic)",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Xqj7TzA4ew4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=40&pp=iAQB",
    illustration_card_number: 62,
    muscle_group: "Compound"
  },
  %{
    name: "Snow Angel/Iron Cross (Standing Aerobic)",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Xqj7TzA4ew4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=40&pp=iAQB",
    illustration_card_number: 63,
    muscle_group: "Compound"
  },
  %{
    name: "Arm Pullover (Standing Aerobic)",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Xqj7TzA4ew4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=40&pp=iAQB",
    illustration_card_number: 64,
    muscle_group: "Compound"
  },
  %{
    name: "Single Leg Pullover",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Xqj7TzA4ew4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=40&pp=iAQB",
    illustration_card_number: 65,
    muscle_group: "Compound"
  },
  %{
    name: "Leg Curl with Seated Fly",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=y9SIIqY6R6k&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=41&pp=iAQB",
    illustration_card_number: 66,
    muscle_group: "Compound"
  },
  %{
    name: "Leg Curl with Straight Arm Lift",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=4Teqzj0hwD8&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=42&pp=iAQB",
    illustration_card_number: 67,
    muscle_group: "Compound"
  },
  %{
    name: "Leg Curl with Biceps Curl",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=9fgG9_-Oi44&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=43&pp=iAQB",
    illustration_card_number: 68,
    muscle_group: "Compound"
  },
  %{
    name: "Leg Curl with Upright Row",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=y9SIIqY6R6k&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=41&pp=iAQB",
    illustration_card_number: 69,
    muscle_group: "Compound"
  },
  %{
    name: "Leg Curl with Seated Surfer",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ZbCcJR-ZQu4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=44&pp=iAQB",
    illustration_card_number: 70,
    muscle_group: "Compound"
  },
  %{
    name: "Lying Leg Curl with Crunch",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=MYSGydgN9fg&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=45&pp=iAQB",
    illustration_card_number: 71,
    muscle_group: "Compound"
  },
  %{
    name: "Toe Touch Biceps Curl",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=pU1QpEKMPvk&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=46&pp=iAQB",
    illustration_card_number: 72,
    muscle_group: "Compound"
  },
  %{
    name: "Toe Touch Row",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=666-iDXTZG4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=47&pp=iAQB",
    illustration_card_number: 73,
    muscle_group: "Compound"
  },
  %{
    name: "Toe Touch Upright Row",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=666-iDXTZG4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=47&pp=iAQB",
    illustration_card_number: 73,
    muscle_group: "Compound"
  },
  %{
    name: "Core Extension",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=K2N6r2ebjDA&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=48&pp=iAQB",
    illustration_card_number: 75,
    muscle_group: "Compound"
  },
  %{
    name: "Half Roll Back with Biceps Curl",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=pU1QpEKMPvk&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=46&pp=iAQB",
    illustration_card_number: 76,
    muscle_group: "Compound"
  },
  %{
    name: "Side Plank",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=US6ci83HSGc&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=49&pp=iAQB",
    illustration_card_number: 77,
    muscle_group: "Compound"
  },
  %{
    name: "Surfer",
    notes: "Exercise focusing on compound muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ZbCcJR-ZQu4&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=44&pp=iAQB",
    illustration_card_number: 78,
    muscle_group: "Compound"
  },
  %{
    name: "Hip Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=ZbEFId5iwRA&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=50&pp=iAQB",
    illustration_card_number: 79,
    muscle_group: "Stretches"
  },
  %{
    name: "Seated Chest Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Xe4nOYkQB_w&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=51&pp=iAQB",
    illustration_card_number: 80,
    muscle_group: "Stretches"
  },
  %{
    name: "Hamstring Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=haahb2hHZFI&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=52&pp=iAQB",
    illustration_card_number: 81,
    muscle_group: "Stretches"
  },
  %{
    name: "Seated Back Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=Y25S3OmVzyI&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=53&pp=iAQB",
    illustration_card_number: 82,
    muscle_group: "Stretches"
  },
  %{
    name: "Front Leg Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=T4AmQ59Lk88&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=54&pp=iAQB",
    illustration_card_number: 83,
    muscle_group: "Stretches"
  },
  %{
    name: "Toe Touch Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=HHJcFllXW70&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=55&pp=iAQB",
    illustration_card_number: 84,
    muscle_group: "Stretches"
  },
  %{
    name: "Hip Flexor Stretch",
    notes: "Exercise focusing on stretches muscles.",
    youtube_link: "https://www.youtube.com/watch?v=BMChrfWWXis&list=PL0FStyO9I01wBl78Tp2y0hwobr8xhRUbP&index=56&pp=iAQB",
    illustration_card_number: 86,
    muscle_group: "Stretches"
  }
]

Enum.each(exercises, fn exercise_attrs ->
  exercise = %Exercise{}
  changeset = Exercise.changeset(exercise, exercise_attrs)
  case Repo.insert(changeset) do
    {:ok, _exercise} ->
      IO.puts("Inserted exercise: #{exercise_attrs[:name]}")
    {:error, changeset} ->
      IO.inspect(changeset.errors)
  end
end)
