
[CmdletBinding()]
param(
    [switch] $Force
)

Import-Module "$PSScriptRoot\AwakeCoding.Blog.psm1" -Force

Get-BlogPostFrontMatter | ForEach-Object {
    $outputFile = "$PWD/static/images/banners/$($_.Slug).png"
    
    # Check if output file exists and -Force is not specified
    if (-not $Force -and (Test-Path $outputFile)) {
        Write-Host "Skipping $($_.Slug) - output file already exists (use -Force to overwrite)" -ForegroundColor Yellow
        return
    }
    
    $bannerParams = @{
        InputFile  = "$PWD/static/images/banners/$($_.Slug)-image.jpg"
        OutputFile = $outputFile
        Title      = $_.Title
    }
    New-BlogPostBannerImage @bannerParams
}
