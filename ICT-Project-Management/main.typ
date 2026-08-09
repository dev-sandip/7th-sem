#import "@preview/ilm:1.4.1": *
#import "@preview/gentle-clues:1.2.0": *
#set text(font: "Charis SIL", size: 11pt, lang: "en")


#show: ilm.with(
  title: [ICT Project Management],
  author: "Sandip Sapkota  ",
  date: datetime(year: 2026, month: 7, day: 01),
  abstract: [Hands on note prepared while we were studying ICT Project Management Course at IOE Purwanchal Campus.],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: true),
)

#include "chapter-8/chapter-8.typ"