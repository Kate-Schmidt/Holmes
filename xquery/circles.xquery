xquery version "3.1";
declare namespace math = "http://www.w3.org/2005/xpath-functions/math";
declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare variable $ad:= doc('../xml/The_Adventures_of_Sherlock_Holmes.xml');
<html>
<head></head>
<body>
<h1>Relative sizes: Stories, quotes</h1>

<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 1100 550">
    <g transform="translate(0,0)">
    
    <g transform="translate(150,150)">
    <circle stroke="blue" stroke-with="5" fill="white"
    cx="150" cy="150" r="{
          let $length:= $ad/string-length()
          return math:sqrt($length) div 3.3
        }"/>
        <!--whc: put your other circles for Adventures here, inside this <g> element.-->
        <circle stroke="green" stroke-with="5" fill="white"
        cx="150" cy="100" r="{
          let $quote_length:= $ad//Q{}quote=>string-join()=>string-length()
          return math:sqrt($quote_length) div 3.3
        }"/>
        </g>
    </g>
</svg>
</body>
</html>