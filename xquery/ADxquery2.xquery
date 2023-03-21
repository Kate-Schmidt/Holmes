declare option saxon:output "method=text";  (:will create a text output stripping out XML element tags etc. :)
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $doubleLine := concat($linefeed,$linefeed);
declare variable $tab := "&#9;";     (: note: global variables come at top of doc and line ends with semicolon :)
declare variable $stories := //story;

for $story in $stories (: Iterate through the list of short stories :)

let $title := $story/storyTitle (:Get the title of the short story :)
let $speakers := $story//quote/@spokeBy => distinct-values() (: Get a distinct list of speakers in this short story :)
    
   for $speaker in $speakers (: Iterate through the list of speakers for each short story :)
        
        let $quotes := $story//quote[@spokeBy=$speaker] (: Make a list of all quotes for the speaker in the short story :)
        for $quote in $quotes (: Iterate through each quote for the speaker :)
        
        (: Display what story the quote is found in, who spoke the quote, and then the quote itself :)
            return ('Short Story:',$tab,$title, 
            $doubleLine, 'Speaker:', $tab, $speaker,
            $doubleLine, 'Quote:', $tab, $quote, $doubleLine) 

