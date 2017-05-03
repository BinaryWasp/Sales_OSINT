$FullName = Read-Host -Prompt 'Input the user name'
$TwitterHandle = Read-Host -Prompt 'Input Twitter Handle'
$CompanyName = Read-Host -Prompt 'Input Company Name'
$GoogleNewsURL='https://www.google.com/#q=' + $CompanyName + '&tbm=nws'
$Email = Read-Host -Prompt 'Input Email Address'
$Address = Read-Host -Prompt 'Input Physical Address'
$SearchRadius = Read-Host -Prompt 'Input Search Radius in miles'


Import-Module .\Get-GeoCoding.ps1
$env:GoogleGeoCode_API_Key = "AIzaSyCE7TjJT5VPxP5Z0YrtB8UoUJht7elj6vc"
$GeoAddress=Get-GeoCoding -Address $Address



if ($FullName) {[System.Diagnostics.Process]::Start('https://twitter.com/search?f=users&q=' + $FullName)}
if ($TwitterHandle) {
	[System.Diagnostics.Process]::Start('https://twitter.com/search?q=from%3A'+$TwitterHandle)
	[System.Diagnostics.Process]::Start('https://twitter.com/search?q=to%3A'+$TwitterHandle)
		    }
if ($CompanyName) {[System.Diagnostics.Process]::Start($GoogleNewsURL)
		   [System.Diagnostics.Process]::Start('https://twitter.com/search?f=tweets&q=' + $CompanyName)
	         	}
if ($Email) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/people/?q=' + $Email)}
if ($FullName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/'+ $FullName + '}/users-named')}
if ($FullName) {[System.Diagnostics.Process]::Start('https://www.linkedin.com/search/results/people/?keywords=' +$FullName + '&origin=SWITCH_SEARCH_VERTICAL')}
if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/pages-named/employees/present/intersect')}
if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/stories-keyword')}
if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.linkedin.com/search/results/companies/?keywords=' + $CompanyName + '&origin=SWITCH_SEARCH_VERTICAL')}
if ($GeoAddress) {[System.Diagnostics.Process]::Start('https://twitter.com/search?f=tweets&q=geocode%3A' + $GeoAddress.Latitude + '%2C' + $GeoAddress.Longitude + '%2C' + $SearchRadius + 'mi&src=typd')}



