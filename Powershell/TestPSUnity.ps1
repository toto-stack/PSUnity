$Session = New-PSUnitySession -ComputerName localhost -Port 7777

# servers
Set-PSUnityServer -Session $Session -X 30 -Y 30 -Name smallFiler -Role Filer -Location Ajaccio -Status 2 -Description "Sunny" -Type 2 
Set-PSUnityServer -Session $Session -X -30 -Y 5 -Name Server1 -Role FIM -Location NY -Status 4 -Description "Server1 is down" 


Set-PSUnityServer -Session $Session -X -20 -Y 5 -Name Server3 -Role IIS -Location Madrid -Status 3 -Description "Server2 has its CPU exceed 90% threshold" 
Set-PSUnityServer -Session $Session -X -10 -Y 5 -Name LYNC1 -Role Lync -Location LV-426 -Status 0 -Description "LYNC1 needs to be rebooted." 

Set-PSUnityServer -Session $Session -X 0 -Y 5 -Name EXSRV1 -Role Exchange -Location Maui -Status 0 -Description "EXSRV1 has drifted its configuration." 
Set-PSUnityServer -Session $Session -X 10 -Y 5 -Name DC1 -Role "DC" -Location "Redmond" -Status 0 -Description "DC1 does not have a configuration." 
Set-PSUnityServer -Session $Session -X 20 -Y 5 -Name DC2 -Role DC -Location Redmond -Status 1 -Description "DC2 did not replicate in over a week." 
Set-PSUnityServer -Session $Session -X 30 -Y 5 -Name DC3 -Role DC -Location Singapore -Status 2 -Description "DC3 is fine." 

Set-PSUnityServer -Session $Session -X -30 -Y 20 -Name NAS1 -Role Isilon -Location Paris -Status 3 -Description "NAS1 does not have a configuration." -Type 1

# sites
Set-PSUnitySite -Session $Session -name "Some Servers" -X 0 -Y 20 -Width 13 -Height 7

# cities
Set-PSUnityCity -Session $Session -Name Milan -Status 1 -Description "DC is fine"
Set-PSUnityCity -Session $Session -Name Rome -Status 2 -Description "DC configuration has drifted"
Set-PSUnityCity -Session $Session -Name Paris -Status 0 -Altname MainDC -Description "a description"
Set-PSUnityCity -Session $Session -Name Brussels -Status 4 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name Amsterdam -Status 4 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name London -Status 1
Set-PSUnityCity -Session $Session -Name Dublin -Status 2 -Description "hello world"
Set-PSUnityCity -Session $Session -Name Madrid -Status 3 -Description "DSC Configuration not found"
Set-PSUnityCity -Session $Session -Name Barcelona -Status 0
Set-PSUnityCity -Session $Session -Name Lisbon -Status 1 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name Tokyo -Status 2 -Description "Replication latency"
Set-PSUnityCity -Session $Session -Name Stockholm -Status 3 -Description "Error during DSC configuration" 
Set-PSUnityCity -Session $Session -Name Seattle -Status 2
Set-PSUnityCity -Session $Session -Name Sydney -Status 1
Set-PSUnityCity -Session $Session -Name Houston -Status 4  -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name Beijing -Status 0
Set-PSUnityCity -Session $Session -Name Oslo -Status 0
Set-PSUnityCity -Session $Session -Name Helsinki -Status 1
Set-PSUnityCity -Session $Session -Name Copenhagen -Status 4 -Description "DC memory is beyond threshold"
Set-PSUnityCity -Session $Session -Name Munich -Status 0
Set-PSUnityCity -Session $Session -Name Berlin -Status 4 -Description "CPU is 100%"
Set-PSUnityCity -Session $Session -Name Dubai -Status 0
Set-PSUnityCity -Session $Session -Name Bangalore -Status 0
Set-PSUnityCity -Session $Session -Name Mumbai -Status 0
Set-PSUnityCity -Session $Session -Name Singapore -Status 0
Set-PSUnityCity -Session $Session -Name "Hong Kong" -Status 0 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name Beijing -Status 0
Set-PSUnityCity -Session $Session -Name Tokyo -Status 0
Set-PSUnityCity -Session $Session -Name Osaka -Status 0 
Set-PSUnityCity -Session $Session -Name "Abu Dhabi" -Status 0 
Set-PSUnityCity -Session $Session -Name Mumbai -Status 0 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name "New York" -Status 0 
Set-PSUnityCity -Session $Session -Name "San Francisco" -Status 0 
Set-PSUnityCity -Session $Session -Name Montreal -Status 0
Set-PSUnityCity -Session $Session -Name Dallas -Status 0
Set-PSUnityCity -Session $Session -Name "Sao Paulo" -Status 0 -Description "DC does not respond"
Set-PSUnityCity -Session $Session -Name Frankfurt -Status 1
Set-PSUnityCity -Session $Session -Name Moscow -Status 2
Set-PSUnityCity -Session $Session -Name "Saint Petersburg" -Status 0
Set-PSUnityCity -Session $Session -Name Taipei -Status 3 -Description "60% of resources failed"
Set-PSUnityCity -Session $Session -Name Shanghai -Status 0
Set-PSUnityCity -Session $Session -Name Seoul -Status 0
Set-PSUnityCity -Session $Session -Name Chicago -Status 4 -Description "DC does not respond"

# Galaxy
Set-PSUnityGalaxy -Session $Session -Name DataCenter1 -Stars 500 -Description "Main Production Datacenter"

# Domains
Set-PSUnityDomain -Session $Session -Name ad.local -Status 4 -Description "no ping from the domain"
Set-PSUnityDomain -Session $Session -Name emea.ad.local -Status 3 -Description "2 DCs drifted their DSC configuration"
Set-PSUnityDomain -Session $Session -Name asia.ad.local -Status 2 -Description "domain responds to ping"

# Data Centre

for ($i = 0; $i -lt 1500; $i++)
{
	
	Set-PSUnityCloud -Session $Session -Site 2 -Name "vm-abc$i" -VMHost "host name" -Cluster "cluster name" -Status 0  -Description Running
}

$color = 3
for ($i = 0; $i -lt 600; $i++)
{
	
	Set-PSUnityCloud -Session $Session -Site 2 -Name "vm-b$i" -VMHost "host name" -Cluster "cluster name" -Status $color  -Description "Running"
	$color++;
	if ($color -eq 5)
	{
		$color = 0
	}
}
$color = 3
for ($i = 0; $i -lt 400; $i++)
{
	
	Set-PSUnityCloud -Session $Session -Site 1 -Name "C$i" -VMHost "host name" -Cluster "cluster name" -Status $color  -Description "Looooooong description to check something"
	$color++;
	if ($color -eq 5)
	{
		$color = 0
	}
}
# Test starting status
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM1" -VMHost "host name" -Cluster "cluster name" -Status 5  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM2" -VMHost "host name" -Cluster "cluster name" -Status 5  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM3" -VMHost "host name" -Cluster "cluster name" -Status 5  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM4" -VMHost "host name" -Cluster "cluster name" -Status 5  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM5" -VMHost "host name" -Cluster "cluster name" -Status 5  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM6" -VMHost "host name" -Cluster "cluster name" -Status 5 

Set-PSUnityCloud -Session $Session -Site 2 -Name "VM7" -VMHost "host name" -Cluster "cluster name" -Status 5 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM8" -VMHost "host name" -Cluster "cluster name" -Status 5 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM9" -VMHost "host name" -Cluster "cluster name" -Status 5 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM10" -VMHost "host name" -Cluster "cluster name" -Status 5 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM11" -VMHost "host name" -Cluster "cluster name" -Status 5 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM12" -VMHost "host name" -Cluster "cluster name" -Status 5 

sleep -Seconds 10

Set-PSUnityCloud -Session $Session -Site 1 -Name "VM1" -VMHost "host name" -Cluster "cluster name" -Status 0
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM2" -VMHost "host name" -Cluster "cluster name" -Status 0  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM3" -VMHost "host name" -Cluster "cluster name" -Status 0  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM4" -VMHost "host name" -Cluster "cluster name" -Status 0  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM5" -VMHost "host name" -Cluster "cluster name" -Status 0  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM6" -VMHost "host name" -Cluster "cluster name" -Status 0 

Set-PSUnityCloud -Session $Session -Site 2 -Name "VM7" -VMHost "host name" -Cluster "cluster name" -Status 0 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM8" -VMHost "host name" -Cluster "cluster name" -Status 0 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM9" -VMHost "host name" -Cluster "cluster name" -Status 0 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM10" -VMHost "host name" -Cluster "cluster name" -Status 0 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM11" -VMHost "host name" -Cluster "cluster name" -Status 0 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM12" -VMHost "host name" -Cluster "cluster name" -Status 0 

sleep -Seconds 10

Set-PSUnityCloud -Session $Session -Site 1 -Name "VM1" -VMHost "host name" -Cluster "cluster name" -Status 6 -Description "shutting down"
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM2" -VMHost "host name" -Cluster "cluster name" -Status 6  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM3" -VMHost "host name" -Cluster "cluster name" -Status 6  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM4" -VMHost "host name" -Cluster "cluster name" -Status 6  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM5" -VMHost "host name" -Cluster "cluster name" -Status 6  
Set-PSUnityCloud -Session $Session -Site 1 -Name "VM6" -VMHost "host name" -Cluster "cluster name" -Status 6 

Set-PSUnityCloud -Session $Session -Site 2 -Name "VM7" -VMHost "host name" -Cluster "cluster name" -Status 6 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM8" -VMHost "host name" -Cluster "cluster name" -Status 6 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM9" -VMHost "host name" -Cluster "cluster name" -Status 6 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM10" -VMHost "host name" -Cluster "cluster name" -Status 6 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM11" -VMHost "host name" -Cluster "cluster name" -Status 6 
Set-PSUnityCloud -Session $Session -Site 2 -Name "VM12" -VMHost "host name" -Cluster "cluster name" -Status 6 



Set-PSUnityCloudInfo -Session $Session -Site 1 -Name "Data Center 1" -Role "HyperV" -Location "Main Data Center" -Status 1 -Description "123"
Set-PSUnityCloudInfo -Session $Session -Site 2 -Name "Data Center 2" -Role "Standby" -Location "Backup Data Center" -Status 4 -Description "No issues found"
Remove-PSUnitySession -Session $Session