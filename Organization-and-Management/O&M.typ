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
  title:"Organization and Management",
  
  
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
  title-page: book-title-page(
    series: "Notes",
    institution: "Sandip Sapkota",
    subtitle: "Notes for O&M at IOE Purwanchal Campus.",
    year: 2026
    // logo: image("images/typst-logo.svg"),
    // cover: image("images/book-cover.jpg", width: 45%)
  ),
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
#include "chapter-4/chapter-4.typ"
#include "chapter-5/chapter-5.typ"