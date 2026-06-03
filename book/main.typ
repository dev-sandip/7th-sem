#import "@preview/bookly:3.1.0": *
#let config-colors = (
  primary: rgb("#1d90d0"),
  secondary: rgb("#dddddd").darken(15%)
)
#show: bookly.with(
  author: "Sandip Sapkota",
  fonts: (
    body: "Linux Libertine",
    math: "Lete Sans Math"
  ),
  title:"Biomedical Instrumentation",
  
  
  // theme: custom,
  // theme: classic,
  // theme: fancy,
  // theme: modern,
  theme: obook,
  // theme: orly,
  // theme: pretty,
  // tufte: true,
  lang: "en",
  colors: config-colors,
  title-page: book-title-page(
    series: "Notes",
    institution: "Sandip Sapkota",
    subtitle: "Exam Notes for IOE",
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
#listoffigures
#listoftables
#include "chapters/chap_main.typ"