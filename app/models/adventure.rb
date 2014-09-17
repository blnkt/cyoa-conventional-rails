class Adventure < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :chapters
  validates :user_id, presence: true
  validates :title, presence: true
  before_create :prologue

  def add_chapter chapter
    self.chapters << chapter
  end

  def progress
    progress = self.chapters.uniq
  end

  def prologue
    if Chapter.all == []
      fChapter.create(prompt: "Welcome to the Adventure", episode: "You awake in a field.  Your limbs ache.  Your mind is fuzzy; full of star-stuffs.  You here only the birds.  You try to stand to better get your bearings int he hot noonday sun but find your knees and elbows particularly weak.  You return to the ground and resign yourself to acclimating more slowly to your surroundings.")
      a1 = "You find a pair of keys.  Pick them up and walk down to the road"
      a2 = "You spy a bike.  Take it out of the field to the nearby road"
      a3 = "You're sitting on a hat! Put it on and head towards the sound of water."
      chapter.add_choice(a1)
      chapter.add_choice(a2)
      chapter.add_choice(a3)

      a1a = "As you start down the road you notice the poppler trees lining it.  They sway in the sweet breeze, bending across the two-lane road to reach eachothers' limbs, but their branches fall short of more than a uspect clutch.  That's when you here the rumble of a sports car raoring towards you."
      b1a = "Duck behind a bush before the car reaches you."
      b2a = "Shimmy up a poppler just as the car passes by."
      b3a = "Stand in the street and wave the driver down."

      a2b = "The bike is a little rusty but it feels good in your hands: familiar.  Halfway to the road you swing yourself up on the bike and rumble down the hill the rest of the way.  You can hear a car approaching in the distance.  When you get to the road you squeeze your brakes.  This is when you realize the bike has no brakes."
      b1b = "Jump from the bike; roll into the road."
      b2b = "Turn the handlebars hard, sending you and the bike sliding into the grass at the side of the road."
      b3b = "Hope for the best, close your eyes, and attempt to careen onto the road at full tilt."

      a3c = "The hat sits low and snug across your brow.  It reminds you of a something someone might wear in the Australian Outback.  The sound of the water grows louder.  Eventually you find a small creek plummetting down a waterfall.  As you get closer you see there's a cave behind the waterfall."
      b1c = "Continue downstream."
      b2c = "Explore the cave"
      b3c = "Plunge into the water"

      chapter_a1 = Chapter.find_by(prompt: a1)
      chapter_a1.update(episode: a1a)
      chapter_a1.add_choice(b1a)
      chapter_a1.add_choice(b2a)
      chapter_a1.add_choice(b3a)

      chapter_a2 = Chapter.find_by(prompt: a2)
      chapter_a2.update(episode: a2b)
      chapter_a2.add_choice(b1b)
      chapter_a2.add_choice(b2b)
      chapter_a2.add_choice(b3b)

      chapter_a3 = Chapter.find_by(prompt: a3)
      chapter_a3.update(episode: a3c)
      chapter_a3.add_choice(b1c)
      chapter_a3.add_choice(b2c)
      chapter_a3.add_choice(b3c)

      c3c1 = "You eye a particularly inviting pool where the waterfall meets the stream and jump in.  The water in crystal clear and icy cold.  The current swirls you in a soft arc about the waterfall's basin.  You are surprised at how long you are able to hold your breath.  When you finally paddle back tot he surface you are even more surprised to find the current, an undertow, is sucking you deeper and deeper, into a suffocating gloom.  You're lungs burn.  Your eyes flit in every direction for an escape from this watery doom."
      Chapter.find_by(prompt: b3c).update(episode: c3c1)

      a1b1 = "You roll and roll and roll.  You hear the bike bang and slide noisily into a broken heap.  The sound of the approaching car grows.  Tenderly you move your legs, then your hands, then your neck.  You move into a crouch.  You look up for the first time since your fall.  You are in the center of the road.  The car sounds even nearer.  With one short inhalation you spin in place.  The car is indeed close!  The driver screams around the bend but doesn't see you.  You are squashed.  Your last thought before oblivion: 'This is why I hate napping.'"
      Chapter.find_by(prompt: b1b).update(episode: a1b1)
    end
  end
end