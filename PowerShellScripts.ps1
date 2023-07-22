$endpoint = "https://api.powerbi.com/beta/52f7eca0-2810-4815-a031-95e5804e6331/datasets/8dda2cc3-cbe6-4581-8a56-abd051f25578/rows?experience=power-bi&key=ref0GK4CEbHzxXx25yRSg0NEDTyfpGg5JpYUWJ11Zg6FxJktUc%2BgNWxkBLuUQGe01jVh5CXRaTAX1xz81FHkMw%3D%3D"
$payload = @{
"Date" ="2023-06-06T11:37:55.103Z"
"CPU" =89.6
"Memory" =15.6
"Time" ="2023-06-06T11:37:55.103Z"
"Network" =82.6
}
Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))