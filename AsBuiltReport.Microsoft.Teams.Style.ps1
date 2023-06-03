# Microsoft Teams Default Document Style

# Configure document options
DocumentOption -EnableSectionNumbering -PageSize A4 -DefaultFont 'Arial' -MarginLeftAndRight 71 -MarginTopAndBottom 71 -Orientation $Orientation

# Configure Heading and Font Styles
Style -Name 'Title' -Size 24 -Color '0076CE' -Align Center
Style -Name 'Title 2' -Size 18 -Color '00447C' -Align Center
Style -Name 'Title 3' -Size 12 -Color '00447C' -Align Left
Style -Name 'Heading 1' -Size 16 -Color '00447C'
Style -Name 'Heading 2' -Size 14 -Color '00447C'
Style -Name 'Heading 3' -Size 12 -Color '00447C'
Style -Name 'Heading 4' -Size 11 -Color '00447C'
Style -Name 'Heading 5' -Size 10 -Color '00447C'
Style -Name 'Normal' -Size 10 -Color '565656' -Default
Style -Name 'Caption' -Size 10 -Color '565656' -Italic -Align Center
Style -Name 'Header' -Size 10 -Color '565656' -Align Center
Style -Name 'Footer' -Size 10 -Color '565656' -Align Center
Style -Name 'TOC' -Size 16 -Color '00447C'
Style -Name 'TableDefaultHeading' -Size 10 -Color 'FAFAFA' -BackgroundColor '0076CE'
Style -Name 'TableDefaultRow' -Size 10 -Color '565656'
Style -Name 'Critical' -Size 10 -BackgroundColor 'F5DBD9'
Style -Name 'Warning' -Size 10 -BackgroundColor 'FEF3B5'
Style -Name 'Info' -Size 10 -BackgroundColor 'E1F1F6'
Style -Name 'OK' -Size 10 -BackgroundColor 'DFF0D0'

# Configure Table Styles
$TableDefaultProperties = @{
    Id = 'TableDefault'
    HeaderStyle = 'TableDefaultHeading'
    RowStyle = 'TableDefaultRow'
    BorderColor = '0076CE'
    Align = 'Left'
    CaptionStyle = 'Caption'
    CaptionLocation = 'Below'
    BorderWidth = 0.25
    PaddingTop = 1
    PaddingBottom = 1.5
    PaddingLeft = 2
    PaddingRight = 2
}

TableStyle @TableDefaultProperties -Default
TableStyle -Id 'Borderless' -HeaderStyle Normal -RowStyle Normal -BorderWidth 0

# Microsoft Teams Cover Page Layout
# Header & Footer
if ($ReportConfig.Report.ShowHeaderFooter) {
    Header -Default {
        Paragraph -Style Header "$($ReportConfig.Report.Name) - v$($ReportConfig.Report.Version)"
    }

    Footer -Default {
        Paragraph -Style Footer 'Page <!# PageNumber #!>'
    }
}

# Set position of report titles and information based on page orientation
if (!($ReportConfig.Report.ShowCoverPageImage)) {
    $LineCount = 5
}
if ($Orientation -eq 'Portrait') {
    BlankLine -Count 11
    $LineCount = 32 + $LineCount
} else {
    BlankLine -Count 7
    $LineCount = 15 + $LineCount
}

# Cover Page Image
if ($ReportConfig.Report.ShowCoverPageImage) {
    Try {
        Image -Text 'AsBuiltReport Logo' -Align 'Center' -Percent 45 -Base64 "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"
        BlankLine -Count 1
    } Catch {
        Write-PScriboMessage -IsWarning "Unable to display cover page image. Please set 'ShowCoverPageImage' to 'false' in the report JSON configuration file to avoid this error."
    }
}

# Add Report Name
Paragraph -Style Title $ReportConfig.Report.Name

if ($AsBuiltConfig.Company.FullName) {
    # Add Company Name if specified
    BlankLine -Count 2
    Paragraph -Style Title2 $AsBuiltConfig.Company.FullName
    BlankLine -Count $LineCount
} else {
    BlankLine -Count ($LineCount + 1)
}
Table -Name 'Cover Page' -List -Style Borderless -Width 0 -Hashtable ([Ordered] @{
        'Author:' = $AsBuiltConfig.Report.Author
        'Date:' = (Get-Date).ToLongDateString()
        'Version:' = $ReportConfig.Report.Version
    })
PageBreak

if ($ReportConfig.Report.ShowTableOfContents) {
    # Add Table of Contents
    TOC -Name 'Table of Contents'
    PageBreak
}
