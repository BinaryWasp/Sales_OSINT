$FullName = Read-Host -Prompt 'Input the user name'
$TwitterHandle = Read-Host -Prompt 'Input Twitter Handle'
$CompanyName = Read-Host -Prompt 'Input Company Name'
$GoogleNewsURL='https://www.google.com/#q=' + $CompanyName + '&tbm=nws'
$Email = Read-Host -Prompt 'Input Email Address'

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
if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/pages-named/employees/present/intersect')}
if ($CompanyName) {[System.Diagnostics.Process]::Start('https://www.facebook.com/search/str/' + $CompanyName + '/stories-keyword')}
