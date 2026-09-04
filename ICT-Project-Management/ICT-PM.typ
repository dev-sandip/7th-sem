
// #import "@preview/ilm:1.4.1": *
// #import "@preview/gentle-clues:1.2.0": *


// #set par(justify: true)
// #set text(
//   font: "Charis SIL",
//   size: 12pt,
//   lang: "en",
// )
// #show: ilm.with(
//   title: [ICT Project Management],
//   author: "Sandip Sapkota  ",
//   date: datetime(year: 2026, month: 9, day: 3),
//   abstract: [Hands on note prepared while we were studying ICT Project Management Course at IOE Purwanchal Campus.],
//   figure-index: (enabled: true),
//   table-index: (enabled: true),
//   listing-index: (enabled: true),
// )
// #include "chapter-1/chapter-1.typ"
// 
// 
 #import "@preview/bookly:3.1.0": *
#let config-colors = (
  primary: rgb("#1d90d0"),
  secondary: rgb("#dddddd").darken(15%)
)
#show: bookly.with(
  author: "Sandip Sapkota",
  fonts: (
    body: "Charis SIL",
    math: "Lete Sans Math"
  ),
  title:"ICT Project Management",
  title-page: book-title-page(
    series: "Notes",
    institution: "IOE Purwanchal Campus",
    subtitle: "Notes for ICT Project Management",
    year: 2026,
    
  ),
  
  // theme: custom,
  // theme: classic,
  // theme: fancy,
  theme: modern,
  // theme: obook,
  // theme: orly,
  // theme: pretty,
  // tufte: true,
  lang: "en",
  colors: config-colors,

  
  config-options: (
    open-right: true,
    // alt-margins: true,

    part-numbering: "A"
  )
)
#tableofcontents

#include "chapter-1/chapter-1.typ"
#include "chapter-2/chapter-2.typ"
#include "chapter-3/chapter-3.typ"
#include "chapter-4 /chapter-4.typ"
#include "chapter-5/chapter-5.typ"
#include "chapter-6/chapter-6.typ"
#include "chapter-7/chapter-7.typ"
#include "chapter-10/chapter-10.typ"
#include "chapter-11/chapter-11.typ"
#include "chapter-12/chapter-12.typ"
#include "chapter-13/chapter-13.typ"
#include "chapter-14/chapter-14.typ"
#include "chapter-15/chapter-15.typ"