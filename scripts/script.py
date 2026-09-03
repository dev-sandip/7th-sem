from pathlib import Path
import re
from datetime import date

today = date.today()
year = today.year
month = today.month
day = today.day

subject_name = input("Enter subject name: ").strip()
chapters = int(input("Enter number of chapters: "))

# Digital Signal Analysis and Processing -> Digital-Signal-Analysis-and-Processing
folder_name = re.sub(r"[^a-zA-Z0-9]+", "-", subject_name).strip("-")

subject_path = Path(folder_name)
subject_path.mkdir(exist_ok=True)

main_content = f'''#import "@preview/ilm:1.4.1": *
#import "@preview/gentle-clues:1.2.0": *
#set text(lang: "en")

#show: ilm.with(
  title: [{subject_name}],
  author: "Sandip Sapkota  ",
  date: datetime(year: {year}, month: {month}, day: {day}),
  abstract: [Hands on note prepared while we were studying {subject_name} Course at IOE Purwanchal Campus.],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)
'''

(subject_path / "main.typ").write_text(main_content)
(subject_path / "refs.bib").touch()

for i in range(1, chapters + 1):
    chapter_folder = subject_path / f"chapter-{i}"
    chapter_folder.mkdir(exist_ok=True)
    (chapter_folder / f"chapter-{i}.typ").touch()

print(f"Created folder: {folder_name}")