
-- Getting metadata of the issue

-- Spíš na probuzení než seriózní práce...
soubor=io.open("../maosnovab.tex", "r")
obsah=soubor:read("*all")
soubor:close()

obsah=unicode.utf8.gsub(obsah, "%$<%$", "<")
obsah=unicode.utf8.gsub(obsah, "%$>%$", ">")
obsah=unicode.utf8.gsub(obsah, "%$\"%$", "\"")
obsah=unicode.utf8.gsub(obsah, "\\prostor(%A)", "%1")
--obsah=unicode.utf8.gsub(obsah, "\\odskoc ?\\odskoc ?", "")

--obsah=unicode.utf8.gsub(obsah, "<td>[]
obsah=unicode.utf8.gsub(obsah, "\\odskoc ?", " ")

obsah=unicode.utf8.gsub(obsah, "\\IeC ", "")
-- čeština ýáíéú ůó ěščřž ťďň
obsah=unicode.utf8.gsub(obsah, "\\\'y", "ý")
obsah=unicode.utf8.gsub(obsah, "\\\'a", "á")
obsah=unicode.utf8.gsub(obsah, "{\\\'\\i }", "í")
obsah=unicode.utf8.gsub(obsah, "\\\'e", "é")
obsah=unicode.utf8.gsub(obsah, "\\\'u", "ú")
obsah=unicode.utf8.gsub(obsah, "\\\'o", "ó")
obsah=unicode.utf8.gsub(obsah, "\\r u", "ů")

obsah=unicode.utf8.gsub(obsah, "\\v e", "ě")
obsah=unicode.utf8.gsub(obsah, "\\v s", "š")
obsah=unicode.utf8.gsub(obsah, "\\v c", "č")
obsah=unicode.utf8.gsub(obsah, "\\v r", "ř")
obsah=unicode.utf8.gsub(obsah, "\\v z", "ž")
obsah=unicode.utf8.gsub(obsah, "\\v t", "ť")
obsah=unicode.utf8.gsub(obsah, "\\v d", "ď")
obsah=unicode.utf8.gsub(obsah, "\\v n", "ň")

obsah=unicode.utf8.gsub(obsah, "\\\'Y", "Ý")
obsah=unicode.utf8.gsub(obsah, "\\\'A", "Á")
obsah=unicode.utf8.gsub(obsah, "{\\\'\\I }", "Í")
obsah=unicode.utf8.gsub(obsah, "\\\'E", "É")
obsah=unicode.utf8.gsub(obsah, "\\\'U", "Ú")
obsah=unicode.utf8.gsub(obsah, "\\\'O", "Ó")
obsah=unicode.utf8.gsub(obsah, "\\r U", "Ŭ")

obsah=unicode.utf8.gsub(obsah, "\\v E", "Ě")
obsah=unicode.utf8.gsub(obsah, "\\v S", "Š")
obsah=unicode.utf8.gsub(obsah, "\\v C", "Č")
obsah=unicode.utf8.gsub(obsah, "\\v R", "Ř")
obsah=unicode.utf8.gsub(obsah, "\\v Z", "Ž")
obsah=unicode.utf8.gsub(obsah, "\\v T", "Ť")
obsah=unicode.utf8.gsub(obsah, "\\v D", "Ď")
obsah=unicode.utf8.gsub(obsah, "\\v N", "Ň")

-- slovenština ĺĹôŕ ľĽÔŔ
obsah=unicode.utf8.gsub(obsah, "\\\'l", "ĺ")
obsah=unicode.utf8.gsub(obsah, "\\\'L", "Ĺ")
obsah=unicode.utf8.gsub(obsah, "\\^o", "ô")
obsah=unicode.utf8.gsub(obsah, "\\\'r", "ŕ")

obsah=unicode.utf8.gsub(obsah, "\\v l", "ľ")
obsah=unicode.utf8.gsub(obsah, "\\v L", "Ľ")
obsah=unicode.utf8.gsub(obsah, "\\^O", "Ô")
obsah=unicode.utf8.gsub(obsah, "\\\'R", "Ŕ")

-- němčina ÿüöä ŸÜÖÄ 
obsah=unicode.utf8.gsub(obsah, "\\\"y", "ÿ")
obsah=unicode.utf8.gsub(obsah, "\\\"u", "ü")
obsah=unicode.utf8.gsub(obsah, "\\\"o", "ö")
obsah=unicode.utf8.gsub(obsah, "\\\"a", "ä")

obsah=unicode.utf8.gsub(obsah, "\\\"Y", "Ÿ")
obsah=unicode.utf8.gsub(obsah, "\\\"U", "Ü")
obsah=unicode.utf8.gsub(obsah, "\\\"O", "Ö")
obsah=unicode.utf8.gsub(obsah, "\\\"A", "Ä")
                         
-- přepis z čínštiny
obsah=unicode.utf8.gsub(obsah, "\\`e", "è")
obsah=unicode.utf8.gsub(obsah, "\\=a", "ā")


obsah=unicode.utf8.gsub(obsah, "\\%-", "")
obsah=unicode.utf8.gsub(obsah, "~", "&nbsp;")

-- 2020-05-08
obsah=unicode.utf8.gsub(obsah, "T\\kern %-%.1667em\\lower %.5ex\\hbox {E}\\kern %-%.125emX{?}?", "TeX")
                         

soubor=io.open("../cislo.tex", "r")
data=soubor:read("*all")
soubor:close()
rocnik=unicode.utf8.match(data, "\\rocnik=(%d+)")
--print(rocnik)
cislo=unicode.utf8.match(data, "\\def\\cisla{(.-)}")
--print(cislo)
hodnotaA=math.floor(rocnik+2008)
print(hodnotaA)
hodnotaB=hodnotaA -- -2000
--print(hodnotaB)
obsah=unicode.utf8.gsub(obsah, "\\the\\hodnotaA ", hodnotaA)
obsah=unicode.utf8.gsub(obsah, "\\the\\hodnotaB ", hodnotaB)
obsah=unicode.utf8.gsub(obsah, "\\the\\cislo ", cislo)

soubor=io.open("../mal-core.aux", "r")
data=soubor:read("*all")
soubor:close()
--print(data)

-- Vytáhni si křížové odkazy
odkazy={}
print()
unicode.utf8.gsub(data, "\\newlabel(%b{})(%b{})", function(s,t)
  --print(s,t)
  s=unicode.utf8.sub(s, 2, -2)
  t=unicode.utf8.sub(t, 2, -2)
  t=unicode.utf8.gsub(t, "%b{}", "", 1)
  t=unicode.utf8.sub(t, 2, -2)
  --print(t)
  t=unicode.utf8.gsub(t,"%}.+","") -- bonus u hyperref
  salt=unicode.utf8.gsub(s, "/", "")
  if s~=salt then 
    print(s,t)
    odkazy["\\pr{"..s.."}"]=t end
  end)
-- Změna
obsah=unicode.utf8.gsub(obsah, "\\pr%b{}", function(s)
 return "<td>"..odkazy[s].."</td>"
 end)
obsah=unicode.utf8.gsub(obsah, "> ", ">")
obsah=unicode.utf8.gsub(obsah, " <", "<")


-- z textu html
obsah=[[<!DOCTYPE html>
<html>
<head>
<title>IB-]]..hodnotaA.."-"..cislo..[[</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
</head>
<body>
]]..obsah..[[
</body>
</html>
]]

-- Tiskni a ulož výsledek
kamsoubor="ib-"..hodnotaA.."-"..cislo.."-utf8.htm"
kam=io.open(kamsoubor, "w")
kam:write(obsah)
kam:close()
print()
print(obsah)

