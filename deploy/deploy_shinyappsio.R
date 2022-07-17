# Deploy to shinyapps.io

rsconnect::setAccountInfo(name='js-rapps',
                          token='0CBD62FED33DC8A564EDB2470311E67D',
                          secret='............') # get secret token at shinyapps.io

rsconnect::deployApp(paste0(getwd(), "./"))
