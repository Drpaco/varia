####work with data on google drive
#FBolduc, 8-11-2016

#https://www.r-bloggers.com/download-all-documents-from-google-drive-with-r/
#see also http://blog.revolutionanalytics.com/2015/09/using-the-googlesheets-package-to-work-with-google-sheets.html
# https://github.com/jennybc/googlesheets/blob/master/vignettes/basic-usage.R


###with RGoogleDocs
#see http://gastonsanchez.com/how-to/2015/04/06/RGoogleDocs-access/

# library(devtools)
# install_github("RGoogleDocs", "duncantl")

# library(RGoogleDocs)
# #unresolvable "Error: Not Found" ? see: https://github.com/duncantl/RGoogleDocs/issues/6
# #library(RCurl)
# email <- "drpacoqc@gmail.com"
# psw <- "IDON'tThinkSo"
# auth = getGoogleAuth(email, psw,service="wise") error happens here


#with googlesheets
    library(googlesheets)
    library(dplyr)
    (my_sheets <- gs_ls())# (expect a prompt to authenticate with Google interactively HERE)
    my_sheets %>% glimpse()

#specify folder?:




