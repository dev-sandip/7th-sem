#import "@preview/ilm:1.4.1": *
#import "@preview/gentle-clues:1.2.0": *
#set text(
  font: "Charis SIL",
  lang: "en",
)
#set par(justify: true)

#show: ilm.with(
  title: [Organization and Management],
  author: "Sandip Sapkota",
  date: datetime(year: 2026, month: 7, day: 01),
  abstract: [Hands on note prepared while we were studying Organization and Management Course at IOE Purwanchal Campus.],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
)

#include "chapter-1/chapter-1.typ"
#include "chapter-2/chapter-2.typ"