#import "@preview/ilm:1.4.1": *
#import "@preview/gentle-clues:1.2.0": *
#set par(justify: true)
#set text(
  font: "Charis SIL",
  size: 12pt,
  lang: "en",
)

#show: ilm.with(
  title: [Distributed System],
  author: "Sandip Sapkota  ",
  date: datetime(year: 2026, month: 9, day: 01),
  abstract: [Hands on note prepared while we were studying Distributed System Course at IOE Purwanchal Campus.],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
)

#include "chapter-1/chapter-1.typ"
#include "chapter-2/chapter-2.typ"
#include "chapter-3/chapter-3.typ"
#include "chapter-4/chapter-4.typ"
#include "chapter-5/chapter-5.typ"
#include "chapter-6/chapter-6.typ"
#include "chapter-7/chapter-7.typ"
#include "chapter-8/chapter-8.typ"
#include "chapter-9/chapter-9.typ"
#include "chapter-10/chapter-10.typ"