declare default element namespace "http://www.tei-c.org/ns/1.0";  (:needed because our input XML is TEI:)
declare option saxon:output "method=text";  (:will create a text output stripping out XML element tags etc. :)

let $p := /section
for $p in /section
return ($p/text)
