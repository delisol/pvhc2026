# pvhcReptProd.R
# renders rmd file and converts html output to pdf
# stores in appropriate Drive directory

# pass report date values
filterDte <- '2026-02-28' #last day of report period
fy_start <- '2026-01-01'
curr_mo_start <- '2026-02-01'
fy_to_date <- filterDte
reptDte <- format(as.Date(fy_to_date), '%B %d, %Y')
currM <- 'Feb' # month of report
nextM <- 'Mar' # change to next month after report date

startDateSubTitle <- 'January 1, 2024'

rmarkdown::render(
  'PvhcMonthlyReport.Rmd',
  output_format = 'html_document',
  output_dir = 'C:\\Users\\dsole\\OneDrive\\Documents\\FinancialPlanning\\PVHC financials\\2026',
  output_file = sprintf('PVHC Monthly Report for %s', reptDte)
)

# convert html outut from render to pdf
# see https://search.r-project.org/CRAN/refmans/psycModel/html/html_to_pdf.html
psycModel::html_to_pdf(
  file_path = sprintf(
    'C:\\Users\\dsole\\OneDrive\\Documents\\FinancialPlanning\\PVHC financials\\2026\\PVHC Monthly Report for %s.html',
    reptDte
  ),
  scale = .88
)
