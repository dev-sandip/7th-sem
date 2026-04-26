# 7th Semester Notes

This repository contains structured course notes for 7th semester subjects, written in Typst and organized subject-wise. Each subject has its own folder with a `main.typ` entry file, chapter subfolders, and a `refs.bib` bibliography file.

## Subjects

- Biomedical Instrumentation
- Computer Networks and Security
- Digital Signal Analysis and Processing
- Distributed System
- Energy, Environment and Society
- ICT Project Management
- Organization and Management

## Repository Structure

```text
7th-sem/
├── Biomedical-Instrumentation/
├── Computer-Networks-and-Security/
├── Digital-Signal-Analysis-and-Processing/
├── Distributed-System/
├── Energy-Environment-and-Society/
├── ICT-Project-Management/
├── Organization-and-Management/
├── Data-Mining
├── script.py
└── Readme.md
```

Each subject directory generally contains:

- `main.typ` as the main Typst document
- `refs.bib` for bibliography entries
- `chapter-N/chapter-N.typ` files for chapter content

## Requirements

- [Typst](https://typst.app/)
- Internet access the first time Typst fetches external packages

The documents currently use these Typst packages:

- `@preview/ilm:1.4.1`
- `@preview/gentle-clues:1.2.0`

## Build

Compile any subject notes by pointing Typst at that subject's `main.typ`.

```bash
typst compile Biomedical-Instrumentation/main.typ
```

Example for another subject:

```bash
typst compile Distributed-System/main.typ
```

If you want live preview while editing:

```bash
typst watch ICT-Project-Management/main.typ
```

## Helper Script

`script.py` is a small generator for creating a new subject folder with:

- a `main.typ` file
- an empty `refs.bib`
- numbered `chapter-N` folders with empty chapter files

Run it with:

```bash
python3 script.py
```

It will ask for:

- subject name
- number of chapters

## Notes

- The notes appear to be prepared for IOE Purwanchal Campus coursework.
- Metadata such as title, author, abstract, and bibliography are defined in each subject's `main.typ`.
- Chapter files are currently separated cleanly, which makes the repository easy to extend subject by subject.
