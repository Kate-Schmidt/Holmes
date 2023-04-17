declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $chapters := //Q{}chapter;
<html>
<head></head>
   <body>
      <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1200"
            height="500">
            <g
                transform="translate(350,100)">
                <g>
                    <text
                        x="0"
                        y="-5"
                        font-family="sans-serif"
                        font-size="20px"
                        fill="white">Character's quotes compared to overall quote amount</text>
                </g>
                <g>
                    {
                        for $chapter at $pos in $chapters
                        let $quotes := $chapters//Q{}quote
                        let $chapterTitle := $chapter/Q{}chapterTitle/string()
                        let $barSize := 800
                            
                            let $count := $chapter//Q{}p/Q{}quote => count()
                            
                            let $SherlockCount := $chapter//Q{}p/Q{}quote[data(@spokeBy) =  'Sherlock_Holmes'] => count()                                        
                            let $SherlockPercent := $SherlockCount div $count
                            let $SherlockBar := $SherlockPercent * $barSize
                            
                            let $WatsonCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'John_Watson')]  => count()
                            let $WatsonPercent := $WatsonCount div $count
                            let $WatsonBar := $WatsonPercent *$barSize
                            let $WatsonBarStart := $SherlockBar
                            
                            let $LestradeCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Lestrade')] => count()
                            let $LestradePercent := $LestradeCount div $count
                            let $LestradeBar := $LestradePercent *$barSize
                            let $LestradeBarStart := $WatsonBarStart + $WatsonBar
                            
                            let $TobiasGregsonCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Tobias_Gregson')] => count()
                            let $TobiasGregsonPercent := $TobiasGregsonCount div $count
                            let $TobiasGregsonBar := $TobiasGregsonPercent *$barSize
                            let $TobiasGregsonBarStart := $LestradeBarStart + $LestradeBar
                            
                            let $JohnFerrierCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'John_Ferrier')] => count()
                            let $JohnFerrierPercent := $JohnFerrierCount div $count
                            let $JohnFerrierBar := $JohnFerrierPercent *$barSize
                            let $JohnFerrierBarStart := $TobiasGregsonBarStart + $TobiasGregsonBar
                            
                            let $LucyFerrierCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Lucy_Ferrier')] => count()
                            let $LucyFerrierPercent := $LucyFerrierCount div $count
                            let $LucyFerrierBar := $LucyFerrierPercent *$barSize
                            let $LucyFerrierBarStart := $JohnFerrierBarStart + $JohnFerrierBar
                            
                            let $JeffersonHopeCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Jefferson_Hope')] => count()
                            let $JeffersonHopePercent := $JeffersonHopeCount div $count
                            let $JeffersonHopeBar := $JeffersonHopePercent *$barSize
                            let $JeffersonHopeBarStart := $LucyFerrierBarStart + $LucyFerrierBar
                            
                            let $EnochJDrebberCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Enoch_J_Drebber')] => count()
                            let $EnochJDrebberPercent := $EnochJDrebberCount div $count
                            let $EnochJDrebberBar := $EnochJDrebberPercent *$barSize
                            let $EnochJDrebberBarStart := $JeffersonHopeBarStart + $JeffersonHopeBar
                            
                            let $JosephStrangersonCount := $chapter//Q{}p/Q{}quote[data(@spokeBy = 'Joseph_Strangerson')] => count()
                            let $JosephStrangersonPercent := $JosephStrangersonCount div $count
                            let $JosephStrangersonBar := $JosephStrangersonPercent *$barSize
                            let $JosephStrangersonBarStart := $EnochJDrebberBarStart + $EnochJDrebberBar
                            
                            let $otherCount := $chapter//Q{}p/Q{}quote[not(contains(@spokeBy, 'Sherlock_Holmes')) and not(contains(@spokeBy, 'John_Watson')) and not(contains(@spokeBy, 'Mary_Sutherland')) and not(contains(@spokeBy, 'Irene_Adler')) and not(contains(@spokeBy, 'Mary_Watson')) and not(contains(@spokeBy, 'Lestrade')) and not(contains(@spokeBy, 'Bradstreet')) and not(contains(@spokeBy, 'Alice_Turner')) ] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $JosephStrangersonBarStart + $JosephStrangersonBar
                            return
                            <g>
                                <text
                                    text-anchor="end"
                                    x="75"
                                    y="{$pos * $yspacer + 5}"
                                    font-family="sans-serif"
                                    font-size="12px"
                                    fill="black">{$chapterTitle}</text>
                                    <g transform="translate(100,0)">
                                        <line 
                                            x1="0"
                                            y1="{$pos * $yspacer}"
                                            x2="{$SherlockBar * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="cyan"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$WatsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$WatsonBar * $xspacer +$WatsonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="black"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$LestradeBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$LestradeBar * $xspacer + $LestradeBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="gray"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$TobiasGregsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$TobiasGregsonBar * $xspacer +$TobiasGregsonBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="green"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$LucyFerrierBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$LucyFerrierBar * $xspacer + $LucyFerrierBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="orange"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$JohnFerrierBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JohnFerrierBar * $xspacer +$JohnFerrierBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="red"
                                            stroke-width="15"/>                          
                                            <line 
                                            x1="{$JeffersonHopeBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JeffersonHopeBar * $xspacer + $JeffersonHopeBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="yellow"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$EnochJDrebberBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$EnochJDrebberBar * $xspacer + $EnochJDrebberBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="pink"
                                            stroke-width="15"/>
                                                                 <line 
                                            x1="{$JosephStrangersonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JosephStrangersonBar * $xspacer + $JosephStrangersonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="purple"
                                            stroke-width="15"/>
                                                                 <line 
                                            x1="{$otherBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$otherBar * $xspacer + $otherBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="blue"
                                            stroke-width="15"/>
                                        
                                    </g>
                            </g>
                    }
                </g>
            </g>
        </svg>  
        <center>Sherlock Holmes is Cyan, John Watson is Black, Lestrade is Gray, Tobias Gregson is Green, </center>
        <center>Lucy Ferrier is Orange, John Ferrier is Red, Jefferson Hope is Yellow, Enoch J Drebber is Pink, </center>
        <center>Joseph Strangerson is Purple, Other Characters are Blue</center>
    </body>
</html>