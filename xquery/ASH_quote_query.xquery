declare option saxon:output "method=text";  (:will create a text output stripping out XML element tags etc. :)
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $doubleLine := concat($linefeed,$linefeed);
declare variable $tab := "&#9;";     (: note: global variables come at top of doc and line ends with semicolon :)
declare variable $stories := //story;

for $story in $stories

let $title := $story/storyTitle
let $speakers := $story//quote/@spokeBy => distinct-values()
    
   for $speaker in $speakers
        
        let $quotes := $story//quote[@spokeBy=$speaker]
        for $quote in $quotes
        
            return ('Short Story:',$tab,$title, 
            $doubleLine, 'Speaker:', $tab, $speaker,
            $doubleLine, 'Quote:', $tab, $quote, $doubleLine)

