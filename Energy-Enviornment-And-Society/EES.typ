// #import "@preview/bookly:3.1.0": *
// #let config-colors = (
//   primary: rgb("#1d90d0"),
//   secondary: rgb("#dddddd").darken(15%)
// )
// #show: bookly.with(
//   author: "Sandip Sapkota",
//   fonts: (
//     body: "New Computer Modern",
//     math: "New Computer Modern Math"
//   ),
//   title:"Energy,Environment and Society",
//   title-page: book-title-page(
//     series: "Notes",
//     institution: "IOE Purwanchal Campus",
//     subtitle: "Notes for O&M",
//     year: 2026,
    
//   ),
  
//   // theme: custom,
//   // theme: classic,
//   // theme: fancy,
//   theme: modern,
//   // theme: obook,
//   // theme: orly,
//   // theme: pretty,
//   // tufte: true,
//   lang: "en",
//   colors: config-colors,

  
//   config-options: (
//     open-right: true,
//     // alt-margins: true,

//     part-numbering: "A"
//   )
// )
// #tableofcontents
#import "@preview/appunti:0.1.0": *

#show: notes.with(
    course: "Energy, Environment and Society",
    degree: "Bachelor in Computer Engineering",
    author: "Sandip Sapkota",
    language: "en",
    
)

#include "chap-4.typ"
#include "chap-5.typ"