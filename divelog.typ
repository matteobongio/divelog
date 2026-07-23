#import "lib.typ" : *

#set text(font: "Liberation Sans", size: 9pt, fill: brand-color.darken(20%))

// A5 with Hole Punch Margin
#set page(
  paper: "a5",
  margin: (
    top: 1cm,
    bottom: 1cm,
    inside: 2cm,
    outside: 1cm,
  ),
)

#let linedNotes = true

#let page = {
  header
  entryDiveExit
  metrics
  suit
  notes(linedNotes: linedNotes) 
  buddyStamp
}

#page
#page

