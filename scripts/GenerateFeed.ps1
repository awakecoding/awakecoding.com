$OutputPath = Join-Path (Get-Location) "public"
$XmlRssPath = Join-Path $OutputPath "rss.xml"

[xml]$xmlContent = Get-Content -Path $XmlRssPath

# Save the XML with UTF-8 encoding without BOM and with 4-space indentations
$xmlWriterSettings = New-Object System.Xml.XmlWriterSettings
$xmlWriterSettings.Indent = $true
$xmlWriterSettings.IndentChars = "    " # 4 spaces
$xmlWriterSettings.OmitXmlDeclaration = $false
$xmlWriterSettings.Encoding = New-Object System.Text.UTF8Encoding($false) # UTF-8 without BOM
$xmlWriter = [System.Xml.XmlWriter]::Create($XmlRssPath, $xmlWriterSettings)
$xmlContent.Save($xmlWriter)
$xmlWriter.Close()

# Generate JSON Feed (https://www.jsonfeed.org/) from RSS XML

[xml]$rss = Get-Content -Path $XmlRssPath

$Items = @()
foreach ($item in $rss.rss.channel.item) {
    $slug = $item.link.Trim('/').Split('/')[-1]
    $banner_image = $item.bannerImage
    $image = $banner_image -Replace "(.*)(\.\w+)$", '$1-image$2'
    $DatePublished = [DateTime]::Parse($item.pubDate).ToString("yyyy-MM-dd'T'HH:mm:ssK")
    $Summary = $item.description
    $Post = [ordered]@{
        id = $slug
        url = $item.link
        title = $item.title
        date_published = $DatePublished
        image = $image
        banner_image = $banner_image
        summary = $Summary
    }
    if ($item.lastUpdated) {
        $LastUpdated = [DateTime]::Parse($item.lastUpdated).ToString("yyyy-MM-dd'T'HH:mm:ssK")
        $Post["last_updated"] = $LastUpdated
    }
    $Tags = @()
    if ($item.tags) {
        $Tags = @($item.tags.tag)
        $Post["tags"] = $Tags
    }
    if ($Tags -contains "CTO") {
        $Items += $Post # JSON feed is filtered for Devolutions
    }
}

$FeedTitle = $rss.rss.channel.title
$HomePageUrl = $rss.rss.channel.link | Where-Object { $_ -is [string] } | Select-Object -First 1
$RssXmlUrl = $rss.rss.channel.link | Where-Object { $_.type -eq 'application/rss+xml' } | Select-Object -First 1 -ExpandProperty 'href'
$FeedUrl = $RssXmlUrl -Replace "rss.xml", "feed.json"

$Feed = [ordered]@{
    version = "https://jsonfeed.org/version/1"
    title = $FeedTitle
    home_page_url = $HomePageUrl
    feed_url = $FeedUrl
    items = $Items
}

$JsonData = $Feed | ConvertTo-Json -Depth 8
Write-Host $JsonData

Set-Content -Path (Join-Path $OutputPath "feed.json") -Value $JsonData -Force
