declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $stories := //Q{}story;
<html>
<head></head>
   <body>
      <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1200"
            height="450">
            <g
                transform="translate(350,100)">
                <g>
                    <text
                        x="375"
                        y="-200"
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
                            
                            let $VictorHatherleyCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Victor_Hatherley')] => count()
                            let $VictorHatherleyPercent := $VictorHatherleyCount div $count
                            let $VictorHatherleyBar := $VictorHatherleyPercent *$barSize
                            let $VictorHatherleyBarStart := $BradstreetBarStart + $BradstreetBar
                            
                            let $AliceTurnerCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Alice_Turner')] => count()
                            let $AliceTurnerPercent := $AliceTurnerCount div $count
                            let $AliceTurnerBar := $AliceTurnerPercent *$barSize
                            let $AliceTurnerBarStart := $VictorHatherleyBarStart + $VictorHatherleyBar
                            
                            let $JamesWindibankCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'James_Windibank')] => count()
                            let $JamesWindibankPercent := $JamesWindibankCount div $count
                            let $JamesWindibankBar := $JamesWindibankPercent *$barSize
                            let $JamesWindibankBarStart := $AliceTurnerBarStart + $AliceTurnerBar
                            
                            let $HosmerAngelCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Hosmer_Angel')] => count()
                            let $HosmerAngelPercent := $HosmerAngelCount div $count
                            let $HosmerAngelBar := $HosmerAngelPercent *$barSize
                            let $HosmerAngelBarStart := $JamesWindibankBarStart + $JamesWindibankBar
                            
                            let $JohnClayCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'John_Clay')] => count()
                            let $JohnClayPercent := $JohnClayCount div $count
                            let $JohnClayBar := $JohnClayPercent *$barSize
                            let $JohnClayBarStart := $HosmerAngelBarStart + $HosmerAngelBar
                            
                            let $AlexanderHolderCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Alexander_Holder')] => count()
                            let $AlexanderHolderPercent := $AlexanderHolderCount div $count
                            let $AlexanderHolderBar := $AlexanderHolderPercent *$barSize
                            let $AlexanderHolderBarStart := $JohnClayBarStart + $JohnClayBar
                            
                            let $VioletHunterCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Violet_Hunter')] => count()
                            let $VioletHunterPercent := $VioletHunterCount div $count
                            let $VioletHunterBar := $VioletHunterPercent *$barSize
                            let $VioletHunterBarStart := $AlexanderHolderBarStart + $AlexanderHolderBar
                            
                            
                            let $UnknownCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Unknown')] => count()
                            let $UnknownPercent := $UnknownCount div $count
                            let $UnknownBar := $UnknownPercent *$barSize
                            let $UnknownBarStart := $VioletHunterBarStart + $VioletHunterBar
                            
                            let $otherCount := $story//Q{}p/Q{}quote[not(contains(@spokeBy, 'Sherlock_Holmes')) and not(contains(@spokeBy, 'John_Watson')) and not(contains(@spokeBy, 'Mary_Sutherland')) and not(contains(@spokeBy, 'Irene_Adler')) and not(contains(@spokeBy, 'Mary_Watson')) and not(contains(@spokeBy, 'Lestrade')) and not(contains(@spokeBy, 'Bradstreet')) and not(contains(@spokeBy, 'Alice_Turner')) and not(contains(@spokeBy, 'Hosmer_Angel')) and not(contains(@spokeBy, 'John_Clay')) and not(contains(@spokeBy, 'Unknown')) ] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $UnknownBarStart + $UnknownBar
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
                                            x1="{$VictorHatherleyBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$VictorHatherleyBar * $xspacer + $VictorHatherleyBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="brown"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$JamesWindibankBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JamesWindibankBar * $xspacer + $JamesWindibankBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="orange"
                                            stroke-width="15"/>
                                            <line 
                                            x1="{$HosmerAngelBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$HosmerAngelBar * $xspacer + $HosmerAngelBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="apricot"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$JohnClayBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JohnClayBar * $xspacer + $JohnClayBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="amber"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$AlexanderHolderBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$AlexanderHolderBar * $xspacer + $AlexanderHolderBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="liver"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$VioletHunterBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$VioletHunterBar * $xspacer + $VioletHunterBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="lavender"
                                            stroke-width="15"/>
                                                                        <line 
                                            x1="{$UnknownBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$UnknownBar * $xspacer + $UnknownBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="lime"
                                            stroke-width="15"/>
                                                                                                            <line 
                                            x1="{$otherBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$otherBar * $xspacer + $otherBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="blue"
                                            stroke-width="15"/>
                                            
                           <!--****************25, 50, 75% lines**************-->
                                            <!--25%-->  <line
                                            x1="187.5"
                                            y1="0"
                                            x2="187.5"
                                            y2="325"
                                            stroke="black"
                                            stroke-width="2"
                                            />
                                            <!--50%-->  <line
                                            x1="375"
                                            y1="0"
                                            x2="375"
                                            y2="325"
                                            stroke="black"
                                            stroke-width="2"
                                            />
                                            <text x="367.5" y="345">50%</text>
                                            <!--75%-->  <line
                                            x1="562.5"
                                            y1="0"
                                            x2="562.5"
                                            y2="325"
                                            stroke="black"
                                            stroke-width="2"
                                            />
                                    </g>
                            </g>
                    }
                </g>
            </g>
        </svg>  
        <center>Sherlock Holmes is Cyan, John Watson is Black, Lestrade is Gray, Mary Sutherland is Green, </center>
        <center>Irene Adler is Orange, Mary Watson is Red, Bradstreet is Yellow, Alice Turner is Pink, </center>
        <center>Victor Hatherley is Brown, James Windibank is Orange, Hosmer Angel is Apricot, John Clay is Amber, </center>
        <center>Alexander Holder is Liver, Violet Hunter is Lavender, Unknown/Not-named Characters are Lime, Other Characters are Blue</center>
    </body>
</html>