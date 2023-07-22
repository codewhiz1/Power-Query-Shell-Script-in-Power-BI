#$endpoint = "https://api.powerbi.com/beta/52f7eca0-2810-4815-a031-95e5804e6331/datasets/8dda2cc3-cbe6-4581-8a56-abd051f25578/rows?experience=power-bi&key=ref0GK4CEbHzxXx25yRSg0NEDTyfpGg5JpYUWJ11Zg6FxJktUc%2BgNWxkBLuUQGe01jVh5CXRaTAX1xz81FHkMw%3D%3D"

while ($true) {

    $ComputerCPU = (Get-WmiObject  -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average

    $ComputerMemory = Get-WmiObject  -Class win32_operatingsystem -ErrorAction Stop
    $UsedMemory = $ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory
    #$Memory = (($UsedMemory / $ComputerMemory.TotalVisibleMemorySize) * 100)
    $Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory) * 100))
    $RoundMemory = [math]::Round($Memory, 2)

    #$DateTime = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss")
    $Date = Get-Date -DisplayHint Date -Format MM/dd/yyyy
    $Time = Get-Date -DisplayHint Time -Format HH:MM:ss

    #$RoundMemory
    #$ComputerCPU 
    #$DateTime
$endpoint = "https://api.powerbi.com/beta/52f7eca0-2810-4815-a031-95e5804e6331/datasets/8dda2cc3-cbe6-4581-8a56-abd051f25578/rows?experience=power-bi&key=ref0GK4CEbHzxXx25yRSg0NEDTyfpGg5JpYUWJ11Zg6FxJktUc%2BgNWxkBLuUQGe01jVh5CXRaTAX1xz81FHkMw%3D%3D"
    $payload = @{
"Date" =$Date
"CPU" =$ComputerCPU
"Memory" =$RoundMemory
"Time" =$Time
"Network" =$UsedMemory
}
Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))

    Write-Host "Date: " $Date " CPU: " $ComputerCPU " Memory: " $RoundMemory " Time: " $Time " Network: " $UsedMemory
    
    Start-Sleep 2
}