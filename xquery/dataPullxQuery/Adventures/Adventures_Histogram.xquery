declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $stories := //Q{}story;
<html>
<head></head>
   <body>
      <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1100"
            height="500">
            <g
                transform="translate(250,100)">
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
                        for $story at $pos in $stories
                        let $quotes := $stories//Q{}quote
                        let $storyName :=$story/Q{}storyTitle/string()
                        let $barSize := 800
                            
                            let $count := $story//Q{}p/Q{}quote => count()
                            
                            let $SherlockCount := $story//Q{}p/Q{}quote[data(@spokeBy) =  'Sherlock_Holmes'] => count()                                        
                            let $SherlockPercent := $SherlockCount div $count
                            let $SherlockBar := $SherlockPercent * $barSize
                            
                            let $WatsonCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'John_Watson')]  => count()
                            let $WatsonPercent := $WatsonCount div $count
                            let $WatsonBar := $WatsonPercent *$barSize
                            let $WatsonBarStart := $SherlockBar
                            
                            let $LestradeCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Lestrade')] => count()
                            let $LestradePercent := $LestradeCount div $count
                            let $LestradeBar := $LestradePercent *$barSize
                            let $LestradeBarStart := $WatsonBarStart + $WatsonBar
                            
                            let $MarySutherlandCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Mary_Sutherland')] => count()
                            let $MarySutherlandPercent := $MarySutherlandCount div $count
                            let $MarySutherlandBar := $MarySutherlandPercent *$barSize
                            let $MarySutherlandBarStart := $LestradeBarStart + $LestradeBar
                            
                            let $IreneAdlerCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Irene_Adler')] => count()
                            let $IreneAdlerPercent := $IreneAdlerCount div $count
                            let $IreneAdlerBar := $IreneAdlerPercent *$barSize
                            let $IreneAdlerBarStart := $MarySutherlandBarStart + $MarySutherlandBar
                            
                            let $MaryWatsonCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Mary_Watson')] => count()
                            let $MaryWatsonPercent := $MaryWatsonCount div $count
                            let $MaryWatsonBar := $MaryWatsonPercent *$barSize
                            let $MaryWatsonBarStart := $IreneAdlerBarStart + $IreneAdlerBar
                            
                            let $BradstreetCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Bradstreet')] => count()
                            let $BradstreetPercent := $BradstreetCount div $count
                            let $BradstreetBar := $BradstreetPercent *$barSize
                            let $BradstreetBarStart := $MaryWatsonBarStart + $MaryWatsonBar
                            
                            let $AliceTurnerCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Alice_Turner')] => count()
                            let $AliceTurnerPercent := $AliceTurnerCount div $count
                            let $AliceTurnerBar := $AliceTurnerPercent *$barSize
                            let $AliceTurnerBarStart := $BradstreetBarStart + $BradstreetBar
                            
                            let $otherCount := $story//Q{}p/Q{}quote[not(contains(@spokeBy, 'Sherlock_Holmes')) and not(contains(@spokeBy, 'John_Watson')) and not(contains(@spokeBy, 'Mary_Sutherland')) and not(contains(@spokeBy, 'Irene_Adler')) and not(contains(@spokeBy, 'Mary_Watson')) and not(contains(@spokeBy, 'Lestrade')) and not(contains(@spokeBy, 'Bradstreet')) and not(contains(@spokeBy, 'Alice_Turner')) ] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $AliceTurnerBarStart + $AliceTurnerBar
                            return
                            <g>
                                <text
                                    text-anchor="end"
                                    x="75"
                                    y="{$pos * $yspacer + 5}"
                                    font-family="sans-serif"
                                    font-size="12px"
                                    fill="black">{$storyName}</text>
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
                                            x1="{$MarySutherlandBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$MarySutherlandBar * $xspacer +$MarySutherlandBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="green"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$IreneAdlerBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$IreneAdlerBar * $xspacer + $IreneAdlerBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="orange"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$MaryWatsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$MaryWatsonBar * $xspacer +$MaryWatsonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="red"
                                            stroke-width="15"/>                          
                                            <line 
                                            x1="{$BradstreetBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$BradstreetBar * $xspacer + $BradstreetBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="yellow"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$AliceTurnerBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$AliceTurnerBar * $xspacer + $AliceTurnerBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="pink"
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
        <p>Sherlock Holmes is Cyan, John Watson is Black, Lestrade is Gray, Mary Sutherland is Green, Irene Adler is Orange, Mary Watson is Red, Bradstreet is Yellow, Alice Turner is Pink, Other Characters are Blue</p>
    </body>
</html>