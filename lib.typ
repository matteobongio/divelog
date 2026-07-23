// Styling 
#let brand-color = rgb("#005f73")
#let light-gray = rgb("#f8f9fa")
#let border-color = rgb("#cbd5e1")

#let field(label) = block(
  width: 100%,
  stroke: (bottom: 0.5pt + border-color),
  inset: (bottom: 3pt, top: 2pt),
  text(size: 7pt, fill: brand-color.darken(20%), weight: "bold", upper(label))
)

#let stdBox(body) = box(
  stroke: 1.5pt + brand-color,
  inset: 5pt,
  radius: 3pt,
  body
)

#let header = grid(
  columns: (auto, auto, auto), gutter: 3pt,
  stdBox(
    text(size: 12pt, weight: "bold", fill: brand-color)[NO. #h(1fr)]
  ),
  stdBox(
    text(size: 12pt, weight: "bold", fill: brand-color)[
      DATE #h(1fr)
    ]
  ),
  grid.cell(rowspan: 3, 
    box(
      stroke: 1.5pt + brand-color,
      inset: (y: 4pt, rest: 2pt),
      radius: 3pt,
      image("Outline-Map-of-World-PDF.pdf"))
  ),
  grid.cell(colspan:2,
    stdBox(
      text(size: 12pt, weight: "bold", fill: brand-color)[
        SITE #h(1fr)
      ]
    )
  ),
  grid.cell(colspan:2,
    stdBox(
      text(size: 12pt, weight: "bold", fill: brand-color)[
        LOCATION#h(1fr)
      ]
    )
  ),
)

#let entryDiveExit = grid(
  columns: (30%, 1fr, 30%), gutter: 3pt,
  stdBox(
  [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Entry]) \
    #field([time in #h(1fr) : #h(1fr)])
    #field([air #h(1fr) bar])
    #field([Surf Int.])
    #field([Pres. group])
  ]),
  stdBox(
  [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Dive]) \
      #field([Duration #h(1fr) mins])
      #field([Avg. depth #h(1fr) m])
      #field([max depth #h(1fr) m])
      #field([safety #h(1fr) yes / no ])
  ]),
  [
  #stdBox(
    [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Exit]) \
    #field([time out #h(1fr) : #h(1fr)])
    #field([air #h(1fr) bar])
    // #field([NDL #h(1fr) mins])
    // #field([Pres. group])
    #v(-0.2em)
  ])
  #v(-0.9em)
  #stdBox(
    [
    #field([SAC #h(1fr) bar/min])
    #v(2.3em)
  ])
],
)


#let metrics = grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 12pt,

  field([Visibility#h(1fr) m]),
  field([O2 #h(1fr) %]),
  field([Weight #h(1fr) kg ]),

  field([Tank #h(2em) L #h(1fr) #sym.circle.big ALU #h(1fr) #sym.circle.big Steel]),
  field([Air Temp #h(1fr) °C ]),
  field([Water Temp #h(1fr) °C ]),
  // field([Water Temp (Surface) #h(1fr) °C ]),
)

#let t(label) = text(size: 8pt, fill: brand-color.darken(20%), weight: "bold", upper(label))

#let suit = {
  grid(
    columns: 7,
    gutter: 1em,
    t[ Suit ] ,
    t[ #sym.ballot #h(1.3em) mm Wet ] ,
    t[ #sym.ballot Dry ],
    t[ #sym.ballot Gloves ],
    t[ #sym.ballot Boots ],
    t[ #sym.ballot Hood],
    t[ #sym.ballot Ice Vest],
  )
}


#let notes(linedNotes: true) = {
  text(size: 8pt, weight: "bold", fill: brand-color, upper("Notes"))
  rect(
    width: 100%,
    height: 7cm,
    stroke: 0.5pt + border-color,
    fill: light-gray,
    radius: 4pt,
    inset: 10pt,
    [
      #if linedNotes {
        let i = 0
        while i < 4 {
        line(start: (0pt, 1cm), end: (100%, 1cm), 
          stroke: (paint: border-color.lighten(50%), dash: "dotted"))
        i = i + 1
      }
    }
  ]
  )
}

#let buddyStamp = grid(
  columns: (1fr, 3.2cm),
  column-gutter: 5pt,
  
    // #v(0.4cm)
    // #field("Buddy Name")
    // #v(0.4cm)
    // #field("Signature / Certification No.")
  rect(
    width: 100%,
    height: 2.4cm,
    stroke: 1.5pt + brand-color,
    radius: 3pt,
    [
    #t[Buddy / dive center / signature / certification no.]
  ]
  ),
  rect(
    width: 100%,
    height: 2.4cm,
    stroke: (paint: brand-color, dash: "dashed", thickness: 1pt),
    radius: 3pt,
    // align(center + horizon)[
    //   #text(size: 7pt, fill: brand-color.lighten(20%), weight: "medium", upper("Buddy / Shop Stamp"))
    // ]
  )
)
