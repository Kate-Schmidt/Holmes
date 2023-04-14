declare namespace math = "http://www.w3.org/2005/xpath-functions/math";




<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Speaker Frequencies in Everyman</text>
    </g>
    <g transform="translate(150,100)">
    <circle cx="100" cy="100" r="
        {
          let $ad:= doc('../xml/The_Adventures_of_Sherlock_Holmes.xml')/string()
          let $lenght:= $ad!string-length()
          return math:sqrt($lenght) div 1000
        }"/>
        </g>
    </g>
</svg>