###################################################
# CompareServicesTxt.ps1
# ed wilson, msft, 6/1/2007
# 
# compares two files for changes in service status
# uses the compare-object cmdlet and get-content
# 
####################################################

$strReference =  "d:\1.txt"
$strDifference = "d:\2.txt"

Compare-Object -referenceobject $(get-content $strReference) -differenceobject $(get-content $strDifference)|fw