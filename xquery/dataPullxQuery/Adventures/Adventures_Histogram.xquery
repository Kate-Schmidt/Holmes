declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $stories := //Q{}story;
<html>
   <body>
      <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1100"
            height="1350">
            <g
                transform="translate(250,100)">
                <g>
                    <text
                        x="0"
                        y="-5"
                        font-family="sans-serif"
                        font-size="20px"
                        fill="white">Recurring Characters in Final Fantasy</text>
                </g>
                <g>
                    {
                        for $story at $pos in $stories
                        let $quotes := $stories//Q{}quote
                        let $storyName :=$story/storyTitle/text()
                        let $barSize := 800
                            
                            let $count := $story//Q{}p => count()
                            
                            let $SherlockCount := $story//Q{}p/Q{}quote[data(@spokeBy) =                                                'Sherlock_Holmes'] => count()
                            let $SherlockPercent := $SherlockCount div $count
                            let $SherlockBar := $SherlockPercent * $barSize
                            
                            let $otherCount := $story//Q{}p/Q{}quote[not(contains(@spokeBy,                                          'Sherlock_Holmes'))] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $SherlockBar
                            return
                            <g>
                                <text
                                    x="-250"
                                    y="{$pos * $yspacer + 5}"
                                    font-family="sans-serif"
                                    font-size="12px"
                                    fill="white">{$storyName}</text>
                                <line 
                                    x1="0"
                                    y1="{$pos * $yspacer}"
                                    x2="{$SherlockBar * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="cyan"
                                    stroke-width="15"/>
                                <line 
                                    x1="{$otherBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$otherBar * $xspacer + $otherBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="blue"
                                    stroke-width="15"/>
                                <line
                                    x1="0"
                                    y1="0"
                                    x2="0"
                                    y2="{max($pos + 1) * $yspacer}"
                                    stroke="white"
                                    stroke-width="2"/>
                            </g>
                    }
                </g>
            </g>
        </svg>    
    </body>
</html>