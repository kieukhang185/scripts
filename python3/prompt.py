import pandas as pd
import random

# Original prompt components
base_genre = "mellow lo-fi hip-hop"
base_bpm = "~80 BPM, laid-back swing"
instruments = [
    "brushed boom-bap drums",
    "warm upright bass",
    "jazzy electric piano chords",
    "đàn tranh",
    "sáo trúc",
    "temple bells"
]
natural_sounds = [
    "chirping cicadas",
    "breeze",
    "distant streams",
    "gentle rain",
    "soft thunder",
    "rustling leaves",
    "village chatter",
    "birdsong"
]
moods = [
    "peaceful",
    "nostalgic",
    "rural Vietnam",
    "calming",
    "contemplative",
    "gentle evening",
    "tranquil morning",
    "introspective",
    "meditative"
]
textures = [
    "muffled highs",
    "rhythmic warmth",
    "vinyl crackle",
    "subtle tape hiss",
    "analog warmth",
    "soft distortion"
]
structures = [
    "atmospheric intro",
    "loopable groove",
    "brief countryside breakdowns",
    "smooth fade-out",
    "gentle build-up",
    "ambient outro"
]

# Generate 100 varied prompts
prompts = []
for _ in range(100):
    selected_instruments = random.sample(instruments, k=random.randint(3, 6))
    selected_natural_sounds = random.sample(natural_sounds, k=random.randint(2, 4))
    selected_moods = random.sample(moods, k=random.randint(3, 5))
    selected_textures = random.sample(textures, k=random.randint(2, 4))
    selected_structures = random.sample(structures, k=random.randint(3, 4))
    
    prompt = (
        f"Genre: {base_genre} with Vietnamese countryside ambiance ({base_bpm}). "
        f"Instrumentation: {', '.join(selected_instruments)}. "
        f"Natural sounds: {', '.join(selected_natural_sounds)}. "
        f"Mood: {', '.join(selected_moods)}. "
        f"Texture: {', '.join(selected_textures)}. "
        f"Structure: {', '.join(selected_structures)}."
    )
    prompts.append(prompt)

# Create a DataFrame to display the generated prompts
df_prompts = pd.DataFrame(prompts, columns=["Generated Prompts"])

import ace_tools as tools; tools.display_dataframe_to_user(name="100 Vietnamese Lo-fi Prompts", dataframe=df_prompts)
