#import "@preview/ilm:1.4.1": *
#import "@preview/gentle-clues:1.2.0": *

#set text(
  lang: "en",
  size: 10pt,
)
#set text(
  font: "Charis SIL",
  lang: "en",
)
#set par(justify: true)


#show: gentle-clues.with(
  stroke-width: 0.8pt,
  border-radius: 4pt,
)

#show: ilm.with(
  title: [Computer Networks and Security],
  author: "Sandip Sapkota",
  date: datetime(year: 2026, month: 7, day: 1),
  abstract: [Hands-on notes prepared while studying the Computer Networks and Security course at IOE Purwanchal Campus.],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false), 
  // table-of-contents: none
)


#include "chapter-1/chapter-1.typ"
#include "chapter-2/chapter-2.typ"
#include "chapter-3/chapter-3.typ"

#include "chapter-5/chapter-5.typ"
#include "chapter-6/chapter-6.typ"
#include "chapter-7/chapter-7.typ"


