declare option saxon:output "method=html";
declare variable $linefeed := "&#10;";

(: This xQuery provides a character list with count for either Sherlock xml doc :)
(: Just change to the correct XML doc :)


let $chapters := //chapter

return(
<details>
    <summary>All Characters</summary>
        {let $people := //quote/@spokeBy => distinct-values()
        
        for $per in $people
        
        order by $per
    
        return(<div><input type="checkbox" id="all" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div>)}
    </details>,
for $chapter at $cIndex in $chapters

let $title := $chapter//chapterTitle/string()

return (
<details>
    <summary>Chapter {$cIndex}</summary>
    <div class="nav-detail">
    <a href="#{$cIndex}">{$title}</a>
    {   let $people := $chapter//quote/@spokeBy => distinct-values()

        for $per at $index in $people 
        
        order by $per
    
        return(
        
        <div><input type="checkbox" id="ch.{$cIndex}" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div>)}
    </div>
</details>))