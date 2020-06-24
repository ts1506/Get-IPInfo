<#
MIT License

Copyright (c) 2020 Shaunak Guharay

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
#>

# Avoid conflicting parameters in current session
$PSDefaultParameterValues.Clear()

function Get-IPInfo {
	param(
		[parameter(Mandatory=$true)]$ip
		[switch]$raw = $false
	)
	
	# Construct URI
	$api = 'http://ip-api.com/json/'
	$uri = $api+$ip
	
	# Invoke and store JSON output
	$result = Invoke-RestMethod -Uri $uri -Method Get
	
	# Check Result
	if ($raw -eq $true) {
		$result
	} elseif ($result.status -eq 'success') {
		Write-Host("IP Addr:`t"+$result.query)
		Write-Host("Country:`t"+$result.country)
		Write-Host("City:`t`t"+$result.city)
		Write-Host("Latitude:`t"+$result.lat)
		Write-Host("Longitude:`t"+$result.lon)
		Write-Host("Time Zone:`t"+$result.timezone)
		Write-Host("ISP:`t`t"+$result.isp)
		Write-Host("Organization:`t"+$result.org)
	} else {
		Write-Host("Unable to resolve IP details")
		Write-Host("Error Message:`t"+$result.message)
	}
}

Export-ModuleMember -Function * -Alias * -Variable *