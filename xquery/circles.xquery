declare namespace math = "http://www.w3.org/2005/xpath-functions/math";
declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
<html>
<head></head>
<body>
<h1>Relative sizes: Stories, quotes</h1>

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    
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
</body>
</html>