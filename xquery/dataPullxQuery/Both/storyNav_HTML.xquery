declare option saxon:output "method=html";
declare variable $linefeed := "&#10;";

(: This xQuery provides a character list with count for either Sherlock xml doc :)
(: Just change to the correct XML doc :)


let $chapters := //chapter

for $chapter at $index in $chapters

let $title := $chapter//chapterTitle/string()

return (
<details>
    <summary>Chapter {$index}</summary>
    <div class="nav-detail">
    <a href="#{$index}">{$title}</a>
    {   let $qPeople := $chapter//quote/@spokeBy => distinct-values()
        let $rPeople := $chapter//person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()

        for $per at $index in $fPeople 
        
        order by $per
    
        return(
        
        <div><input type="checkbox" id="{$per}" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div>)}
    </div>
</details>)