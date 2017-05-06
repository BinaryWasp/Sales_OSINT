

$FullName = Read-Host -Prompt 'Input the user name'
$TwitterHandle = Read-Host -Prompt 'Input Twitter Handle'
$CompanyName = Read-Host -Prompt 'Input Company Name'

$Email = Read-Host -Prompt 'Input Email Address'
$Address = Read-Host -Prompt 'Input Physical Address'
$SearchRadius = Read-Host -Prompt 'Input Search Radius in miles'
if (!$SearchRadis) {$SearchRadius=1}
$Date = Get-Date -format "yyyyMMdd"
$FullNameMinusSpaces = $FullName -replace '\s','_' 
$FileName= $Date + "_" + $FullNameMinusSpaces 
$FormattedDate = Get-Date

$TwitterCompanySearch = "https://twitter.com/search?f=tweets&q=$CompanyName"
$GoogleNewsURL="https://www.google.com/#q=$CompanyName&tbm=nws"



Import-Module .\Get-GeoCoding.ps1
$env:GoogleGeoCode_API_Key = "AIzaSyCE7TjJT5VPxP5Z0YrtB8UoUJht7elj6vc"
if ($Address){$GeoAddress=Get-GeoCoding -Address $Address}

#Only for Testing.
#Remove when ready for Prod
remove-item "$FileName.htm"


#Exporting Data to Screen
 if ($FullName) {
                 [System.Diagnostics.Process]::Start("https://twitter.com/search?f=users&q=$FullName")
                 [System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/'+ $FullName + '}/users-named')
                 [System.Diagnostics.Process]::Start('https://www.linkedin.com/search/results/people/?keywords=' +$FullName + '&origin=SWITCH_SEARCH_VERTICAL')
                }


 if ($TwitterHandle) {
	[System.Diagnostics.Process]::Start("https://twitter.com/search?q=from%3A$TwitterHandle")
	[System.Diagnostics.Process]::Start("https://twitter.com/search?q=to%3A$TwitterHandle")
                     }
 if ($CompanyName) {[System.Diagnostics.Process]::Start($GoogleNewsURL)
		             [System.Diagnostics.Process]::Start('https://twitter.com/search?f=tweets&q=' + $CompanyName)
	         	}
 if ($Email) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/people/?q=' + $Email)}
 if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/pages-named/employees/present/intersect')}
 if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/stories-keyword')}
 if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.linkedin.com/search/results/companies/?keywords=' + $CompanyName + '&origin=SWITCH_SEARCH_VERTICAL')}
 if ($GeoAddress) {[System.Diagnostics.Process]::Start('https://twitter.com/search?f=tweets&q=geocode%3A' + $GeoAddress.Latitude + '%2C' + $GeoAddress.Longitude + '%2C' + $SearchRadius + 'mi&src=typd')}






#Exporting to HTML
Add-Content "$FileName.htm" "<html>"
Add-Content "$FileName.htm" "<head></head>"
Add-Content "$FileName.htm" "<body bgcolor=white text=black>"
Add-Content "$FileName.htm" "<h1>OSINT Report: $FullName</h1>"

Add-Content "$FileName.htm" "Date Run:<br>"
Add-Content "$FileName.htm" "$FormattedDate </br><br>"

Add-Content "$FileName.htm" "Full Name:<br>"
Add-Content "$FileName.htm" "$FullName </br><br>"



if ($FullName) {
                    Add-Content "$FileName.htm" "<a href='$TwitterUsernameSearch'>Twitter Username Search</a></br><br>"
                    Add-Content "$FileName.htm" "<a href='https://www.facebook.com/search/str/$FullName/users-named'>Facebook Username Search</a></br><br>"
                    Add-Content "$FileName.htm" "<a href='https://www.linkedin.com/search/results/people/?keywords=$FullName&origin=SWITCH_SEARCH_VERTICAL'>LinkedIn Username Search</a></br><br>"
               }






if ($TwitterHandle) {
Add-Content "$FileName.htm" "Twitter Handle:<br>"
#Add-Content "$FileName.htm" "<a href='https://twitter.com/$TwitterHandle'>$TwitterHandle</a> </br><br>"
Add-Content "$FileName.htm" "<a href='https://twitter.com/search?q=from%3A$TwitterHandle'>From</a> </br><br>"
Add-Content "$FileName.htm" "<a href='https://twitter.com/search?q=to%3A$TwitterHandle'>Twitter Mentions</a> </br><br>"
}



if ($CompanyName) {
                   Add-Content "$FileName.htm" "<a href='$GoogleNewsURL'>Google News</a> </br><br>"
                   Add-Content "$FileName.htm" "<a href='$TwitterCompanySearch'>TwitterCompany Search</a></br><br>"
                    }


Add-Content "$FileName.htm" "</body>"
Add-Content "$FileName.htm" "</html>"
