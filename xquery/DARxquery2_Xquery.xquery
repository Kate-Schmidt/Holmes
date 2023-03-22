declare option saxon:output "method=text"; (:will create a text output stripping out XML element tags etc. :)
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $tab := "&#9;";     (: note global variables come at top of doc and line ends with semicolon :)

(:DAR Created chapters variable and then started for loop to loop to loop through each individual chapter:)
let $chapters := //book/part/chapter
let $chars := $chapters//person/@perName => distinct-values()

for $chapter in $chapters
    (:Initialized chapTitle, chars, char count variables:)
    let $chapTitle := $chapter/chapterTitle
    
    for $char in $chars
        let $charCount := $chapter//person[@perName=$char]=>count()
        (:Ordering the output by character count:)
        order by $charCount descending 
        (:Using where statement to only include character-dense chapters:)
        where $charCount > 15
        (:Looping through and counting number of characters & returning the information per each chapter:)
    
        return ($chapTitle, $charCount, $tab, $char, $tab, $linefeed)