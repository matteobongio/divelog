// --- Page Configuration (A5 Format with 3-Ring Punch Margin) ---
#set page(
  paper: "a5",
  flipped: false,
  margin: (
    top: 1cm,
    bottom: 1cm,
    inside: 2cm,  // Extra space on the binding side for 3-ring hole punching
    outside: 1cm,
  ),
)

#set text(font: "Liberation Sans", size: 9pt, fill: rgb("#1a1a1a"))
#set align(top)

// --- Styling Helpers ---
#let brand-color = rgb("#005f73")
#let light-gray = rgb("#f8f9fa")
#let border-color = rgb("#cbd5e1")

#let field(label, body) = block(
  width: 100%,
  stroke: (bottom: 0.5pt + border-color),
  inset: (bottom: 3pt, top: 2pt),
  [
    #text(size: 7pt, fill: brand-color.darken(20%), weight: "bold", upper(label)) \
    #v(-2pt)
    #body
  ]
)
#let stdBox(body) = box(
  stroke: 1.5pt + brand-color,
  inset: 5pt,
  radius: 3pt,
  body
)

// --- Header ---
#grid(
  columns: (14em, auto, auto), gutter: 3pt, row-gutter: 15pt,
  // align(left + bottom)[
  //   #text(size: 18pt, weight: "bold", fill: brand-color)[DIVE LOG]
  // ],
  [
    #stdBox(
      text(size: 12pt, weight: "bold", fill: brand-color)[DIVE NO. #h(1fr)]
    )
  ],
  [
    #stdBox(
      text(size: 12pt, weight: "bold", fill: brand-color)[
        DATE #h(1fr)
      ]
    )
  ],
  grid.cell(rowspan: 2, 
    box(
      stroke: 1.5pt + brand-color,
      inset: (rest: 1pt),
      radius: 3pt,
    image("Outline-Map-of-World-PDF.pdf"))
  ),
  grid.cell(colspan:2,
  [
    #stdBox(
      text(size: 12pt, weight: "bold", fill: brand-color)[
        LOCATION #h(1fr)
      ]
    )
  ]),
  // [
  //   #box(
  //     stroke: 1.5pt + brand-color,
  //     inset: 5pt,
  //     radius: 3pt,
  //     text(size: 12pt, weight: "bold", fill: brand-color)[
  //       BUDDY#h(1fr)
  //     ]
  //   )
  // ],
  // [
  //   #box(
  //     stroke: 1.5pt + brand-color,
  //     inset: 5pt,
  //     radius: 3pt,
  //     text(size: 12pt, weight: "bold", fill: brand-color)[
  //       // AIR TEMP#h(1fr)
  //     ]
  //   )
  // ],
)

#grid(
  columns: (30%, 1fr, 30%), gutter: 3pt,
  stdBox(
    [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Entry]) \
      #field([Surf Int.], [])
      #field([Pres. group], [])
      #field([time in #h(1fr) : #h(1fr)], [])
      #field([air #h(1fr) bar], [])
    ]
  ),
  stdBox(
    [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Dive]) \
      #field([Bottom time #h(1fr) mins], [])
      #field([Avg. depth #h(1fr) m], [])
      #field([max depth #h(1fr) m], [])
      #field([safety #h(1fr) mins], [])
    ]
  ),
  stdBox(
    [
    #text(size: 11pt, fill: brand-color.darken(20%), weight: "bold", [Exit]) \
      #field([NDL #h(1fr) mins], [])
      #field([Pres. group], [])
      #field([time out #h(1fr) : #h(1fr)], [])
      #field([air #h(1fr) bar], [])
    ]
  ),
)


// --- Core Dive Metrics Grid ---
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 12pt,
  
  // --- Environment & Gear Parameters ---
  
  field([Visibility#h(1fr) m], []),
  
  field("Gas Mix", [ ]), //#box(square(size: 6pt, stroke: 0.5pt)) Air \  #box(square(size: 6pt, stroke: 0.5pt)) EANx #h(1fr) % ]),
  field([Weight Added #h(1fr) kg ], []),
  field("Suit Type", []),
  
  field([Air Temp #h(1fr) °C ], []),
  // field([Water Temp (Surface) #h(1fr) °C ], []),
  field([Water Temp #h(1fr) °C ], []),
)

// --- Dive Profile Notes / Sketch Area ---
#text(size: 8pt, weight: "bold", fill: brand-color, upper("Dive Notes"))
#v(2pt)
#rect(
  width: 100%,
  height: 6.5cm,
  stroke: 0.5pt + border-color,
  fill: light-gray,
  radius: 4pt,
  inset: 10pt,
  [
    // Subtle grid background lines for sketching
    #place(top + left)[
      #line(start: (0pt, 1.5cm), end: (100%, 1.5cm), stroke: (paint: border-color.lighten(50%), dash: "dotted"))
      #line(start: (0pt, 3.0cm), end: (100%, 3.0cm), stroke: (paint: border-color.lighten(50%), dash: "dotted"))
      #line(start: (0pt, 4.5cm), end: (100%, 4.5cm), stroke: (paint: border-color.lighten(50%), dash: "dotted"))
    ]
  ]
)

#v(0.2cm)

// --- Verification & Verification Stamp Zone ---
#grid(
  columns: (1.5fr, 1fr),
  column-gutter: 15pt,
  
  align(left)[
    #v(0.4cm)
    #field("Buddy / Instructor Name", [])
    #v(0.4cm)
    #field("Signature / Certification No.", [])
  ],
  align(right)[
    #rect(
      width: 3.5cm,
      height: 2.2cm,
      stroke: (paint: brand-color, dash: "dashed", thickness: 1pt),
      radius: 3pt,
      // align(center + horizon)[
      //   #text(size: 7pt, fill: brand-color.lighten(20%), weight: "medium", upper("Buddy / Shop Stamp"))
      // ]
    )
  ]
)
