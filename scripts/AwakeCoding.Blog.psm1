
function New-BlogPostBannerImage {
    <#
    .SYNOPSIS
    Creates a blog banner image by combining an input image with text overlay.
    
    .DESCRIPTION
    The New-BlogPostBannerImage cmdlet creates a professional blog banner by placing an input image 
    on the left side and overlaying text on the right side with customizable styling.
    
    .PARAMETER InputFile
    Path to the input image file
    
    .PARAMETER OutputFile
    Path where the output banner image will be saved
    
    .PARAMETER Title
    The title text to display on the banner
    
    .PARAMETER LineBreakMode
    Controls how text line breaks are handled:
    - auto: Let system handle text wrapping (default)
    - manual: Use | character to specify line breaks
    - balanced: Automatically balance line lengths for better appearance
    
    .EXAMPLE
    New-BlogPostBannerImage -InputFile "C:\images\rust-mcp-proxy-image.jpg" -OutputFile "C:\banners\rust-mcp-proxy.png" -Title "Vibe coding a Rust MCP proxy in VSCode with GitHub Copilot"
    
    .EXAMPLE
    New-BlogPostBannerImage -InputFile "example-image.jpg" -OutputFile "example.png" -Title "Windows Virtual|Network using|Wintun and|tun2socks" -LineBreakMode "manual"
    
    .EXAMPLE
    New-BlogPostBannerImage -InputFile "example-image.jpg" -OutputFile "example.png" -Title "Windows Virtual Network using Wintun and tun2socks" -LineBreakMode "balanced"
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string] $InputFile,
        
        [Parameter(Mandatory=$true, Position=1)]
        [string] $OutputFile,
        
        [Parameter(Mandatory=$true, Position=2)]
        [string] $Title,
        
        [Parameter()]
        [ValidateSet("auto", "manual", "balanced")]
        [string] $LineBreakMode = "auto"
    )
    
    # Load required assemblies
    Add-Type -AssemblyName System.Drawing
    Add-Type -AssemblyName System.Windows.Forms

    # Resolve full paths
    $inputImagePath = Resolve-Path $InputFile -ErrorAction Stop
    $outputImagePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFile)
    
    # Ensure output directory exists
    $outputDir = Split-Path $outputImagePath -Parent
    if (-not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    }
    
    # Configuration
    $outputWidth = 1280
    $outputHeight = 640
    $borderWidth = 16
    $borderColor = [System.Drawing.Color]::FromArgb(247, 172, 8) # #F7AC08
    $textColor = [System.Drawing.Color]::FromArgb(247, 172, 8)   # #F7AC08
    $backgroundColor = [System.Drawing.Color]::FromArgb(64, 64, 64) # Dark gray background
    
    # Verify input file exists
    if (-not (Test-Path $inputImagePath)) {
        throw "Input image not found: $inputImagePath"
    }
    
    try {
        Write-Verbose "Creating banner image for: $Title"
        Write-Verbose "Input: $inputImagePath"
        Write-Verbose "Output: $outputImagePath"
        
        # Create output bitmap
        $outputBitmap = New-Object System.Drawing.Bitmap($outputWidth, $outputHeight)
        $graphics = [System.Drawing.Graphics]::FromImage($outputBitmap)
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
        $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
        
        # Fill background
        $backgroundBrush = New-Object System.Drawing.SolidBrush($backgroundColor)
        $graphics.FillRectangle($backgroundBrush, 0, 0, $outputWidth, $outputHeight)
        
        # Draw border
        $borderPen = New-Object System.Drawing.Pen($borderColor, $borderWidth)
        $borderRect = New-Object System.Drawing.Rectangle(
            ($borderWidth / 2), 
            ($borderWidth / 2), 
            ($outputWidth - $borderWidth), 
            ($outputHeight - $borderWidth)
        )
        $graphics.DrawRectangle($borderPen, $borderRect)
        
        # Load and resize input image
        $inputImage = [System.Drawing.Image]::FromFile($inputImagePath)
        $imageWidth = 624
        $imageHeight = 608
        
        # Calculate image position (left side, centered vertically within border)
        $imageX = $borderWidth + (($outputWidth / 2 - $borderWidth - $imageWidth) / 2)
        $imageY = ($outputHeight - $imageHeight) / 2
        
        $imageRect = New-Object System.Drawing.Rectangle($imageX, $imageY, $imageWidth, $imageHeight)
        $graphics.DrawImage($inputImage, $imageRect)
        
        # Calculate text area (right side within border)
        $textAreaX = $outputWidth / 2
        $textAreaY = $borderWidth
        $textAreaWidth = ($outputWidth / 2) - ($borderWidth * 1.5)
        $textAreaHeight = $outputHeight - ($borderWidth * 2)
        
        # Create text formatting
        $textBrush = New-Object System.Drawing.SolidBrush($textColor)
        $stringFormat = New-Object System.Drawing.StringFormat
        $stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
        $stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
        $stringFormat.FormatFlags = [System.Drawing.StringFormatFlags]::LineLimit
        
        # Process text based on line break mode
        $processedTitle = switch ($LineBreakMode) {
            "manual" {
                Write-Verbose "Using manual line breaks"
                # Look for manual line breaks (|) in the title
                $Title -replace '\|', "`n"
            }
            "balanced" {
                Write-Verbose "Using balanced line breaks"
                # Try to balance line lengths for better visual appearance
                $words = $Title -split '\s+'
                if ($words.Count -le 3) {
                    $Title  # Keep short titles on one line
                } elseif ($words.Count -le 6) {
                    # Split roughly in half
                    $midPoint = [Math]::Ceiling($words.Count / 2)
                    ($words[0..($midPoint-1)] -join ' ') + "`n" + ($words[$midPoint..($words.Count-1)] -join ' ')
                } else {
                    # For longer titles, try to break into 3 lines
                    $third = [Math]::Ceiling($words.Count / 3)
                    $line1 = $words[0..($third-1)] -join ' '
                    $line2 = $words[$third..(2*$third-1)] -join ' '
                    $line3 = $words[(2*$third)..($words.Count-1)] -join ' '
                    "$line1`n$line2`n$line3"
                }
            }
            default {
                Write-Verbose "Using automatic line breaks"
                # Auto mode - let system handle wrapping
                $Title
            }
        }
        
        # Use fixed Arial 50pt font to match Snagit template
        $font = New-Object System.Drawing.Font("Arial", 50, [System.Drawing.FontStyle]::Bold)
        
        # Draw text with shadow
        $shadowOffset = 4
        $shadowColor = [System.Drawing.Color]::FromArgb(180, 0, 0, 0) # Darker, more pronounced shadow
        $shadowBrush = New-Object System.Drawing.SolidBrush($shadowColor)
        
        # Draw text shadow first (offset)
        $shadowRect = New-Object System.Drawing.RectangleF(
            ($textAreaX + $shadowOffset), 
            ($textAreaY + $shadowOffset), 
            $textAreaWidth, 
            $textAreaHeight
        )
        $graphics.DrawString($processedTitle, $font, $shadowBrush, $shadowRect, $stringFormat)
        
        # Draw actual text on top
        $textRect = New-Object System.Drawing.RectangleF($textAreaX, $textAreaY, $textAreaWidth, $textAreaHeight)
        $graphics.DrawString($processedTitle, $font, $textBrush, $textRect, $stringFormat)
        
        # Save output image
        $outputBitmap.Save($outputImagePath, [System.Drawing.Imaging.ImageFormat]::Png)
        
        Write-Host "Blog banner created successfully: $outputImagePath" -ForegroundColor Green
        
        # Return the output file path as an object
        [PSCustomObject]@{
            InputImage = $inputImagePath
            OutputImage = $outputImagePath
            Title = $Title
            LineBreakMode = $LineBreakMode
            Success = $true
        }
        
    }
    catch {
        Write-Error "Error creating blog banner: $($_.Exception.Message)"
        
        # Return error object
        [PSCustomObject]@{
            InputImage = $inputImagePath
            OutputImage = $outputImagePath
            Title = $Title
            LineBreakMode = $LineBreakMode
            Success = $false
            Error = $_.Exception.Message
        }
        
        throw
    }
    finally {
        # Clean up resources
        if ($graphics) { $graphics.Dispose() }
        if ($outputBitmap) { $outputBitmap.Dispose() }
        if ($inputImage) { $inputImage.Dispose() }
        if ($font) { $font.Dispose() }
        if ($textBrush) { $textBrush.Dispose() }
        if ($backgroundBrush) { $backgroundBrush.Dispose() }
        if ($shadowBrush) { $shadowBrush.Dispose() }
        if ($borderPen) { $borderPen.Dispose() }
        if ($stringFormat) { $stringFormat.Dispose() }
    }
}

function Get-BlogPostFrontMatter {
    <#
    .SYNOPSIS
    Extracts title, slug, and banner from markdown files with TOML front matter.
    
    .PARAMETER Path
    Path to the directory containing markdown files (default: content/posts/)
    
    .EXAMPLE
    Get-BlogPostFrontMatter
    
    .EXAMPLE
    Get-BlogPostFrontMatter -Path "content/posts/"
    #>
    
    [CmdletBinding()]
    param(
        [string] $Path
    )

    if ([string]::IsNullOrEmpty($Path)) {
        $Path = Join-Path $PWD "content/posts"
    }
    
    Get-ChildItem -Path $Path -Filter "*.md" -File | Where-Object { $_.Name -ne "_index.md" } | ForEach-Object {
        $content = Get-Content -Path $_.FullName -Raw
        
        if ($content -match '(?s)^\+\+\+\s*\r?\n(.*?)\r?\n\+\+\+') {
            $frontMatter = $matches[1]
            
            # Extract fields using regex
            $title = if ($frontMatter -match 'title\s*=\s*"([^"]*)"') { $matches[1] } else { $null }
            $slug = if ($frontMatter -match 'slug\s*=\s*"([^"]*)"') { $matches[1] } else { $null }
            $banner = if ($frontMatter -match '\[extra\][\s\S]*?banner\s*=\s*"([^"]*)"') { $matches[1] } else { $null }
            
            [PSCustomObject]@{
                FileName = $_.Name
                Title = $title
                Slug = $slug
                Banner = $banner
            }
        }
    }
}
