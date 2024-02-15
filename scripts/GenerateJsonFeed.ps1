$OutputPath = Join-Path (Get-Location) "public"
[xml]$rss = Get-Content -Path (Join-Path $OutputPath "rss.xml")

$items = @()
foreach ($item in $rss.rss.channel.item) {
    $slug = $item.link.Trim('/').Split('/')[-1]
    $banner_image = ($rss.rss.channel.item[0].meta | Where-Object { $_.property -eq 'og:image' }).content
    $image = $banner_image -Replace "(.*)(\.\w+)$", '$1-image$2'
    $DatePublished = [DateTime]::Parse($item.pubDate).ToString("yyyy-MM-dd'T'HH:mm:ssK")
    $Summary = $item.description
    $post = New-Object PSObject -Property @{
        id = $slug
        url = $item.link
        title = $item.title
        date_published = $DatePublished
        image = $image
        banner_image = $banner_image
        summary = $Summary
    }
    $items += $post
}

$HomePageUrl = $rss.rss.channel.link
$FeedTitle = $rss.rss.channel.title
$FeedUrl = $HomePageUrl.Trim('/') + "/feed.json"

$feed = @{
    version = "https://jsonfeed.org/version/1"
    title = $FeedTitle
    home_page_url = $HomePageUrl
    feed_url = $FeedUrl
    items = $items
}

$JsonData = $feed | ConvertTo-Json
Write-Host $JsonData

Set-Content -Path (Join-Path $OutputPath "feed.json") -Value $JsonData -Force
