
# This is the user interface of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



# USER INTERFACE

source("data.R", local=TRUE)  # Connect to data.R where you may see all the data inputs
source("global.R", local=TRUE)  # Connect to data.R where you may see all the data inputs


################################# User Interface definition, all tabs ###################################

ui <- dashboardPage(skin='black',
                    ################# Main dashboard header        
                    dashboardHeader(
                      title= 'Toolkit for Humanitarian Data Analysis',
                      titleWidth = 400),
                    
                    ################## Side bar content
                    dashboardSidebar(
                      width = 350,
                      sidebarMenu(
                        menuItem("INTRODUCTION", tabName = "intro", icon = icon("info-circle")),
                        br(),
                        menuItem('NICE TO KNOW', tabName = 'knowledge', icon = icon("lightbulb-o")),
                        br(),
                        menuItem('R MAP TEMPLATES', tabName = 'maps', icon = icon("globe")),
                        br(),
                        menuItem('STATISTICAL ANALYSIS', tabName = 'statistics', icon = icon("line-chart")),
                        menuSubItem('Probability and Statistics', tabName = 'statistics_prob'),
                        menuSubItem('Introductory Econometrics', tabName = 'statistics_intro'),
                        menuSubItem('Advanced Econometrics', tabName = 'statistics_adva'),
                        menuSubItem('Econometrics for Humanitarian Analyses', tabName = 'statistics_huma'),
                        br(),
                        
                        menuItem('ON-LINE LEARNING', tabName = 'learning', icon = icon("book")),
                        menuSubItem('Statistics', tabName = 'learning_statistics'),
                        menuSubItem('Mapping', tabName = 'learning_mapping'),
                        menuSubItem('Infographics', tabName = 'learning_infographics'),
                        menuSubItem('Image Processing', tabName = 'learning_image_processing'),
                        menuSubItem('Reporting', tabName = 'learning_reporting'),
                        menuSubItem('Webdevelopment', tabName = 'learning_webdevelopment'),
                        br(),
                        
                        menuItem('PIM', tabName = 'pim', icon = icon("connectdevelop")),
                        br(),
                        menuItem('CRISIS PHASE', tabName = 'crisis', icon = icon("support")),
                        br(),
                        menuItem('SOFTWARE REVIEW', tabName = 'software', icon = icon("check-square"))
                      )
                      
                    ),
                    ################## PAGE CONTENT BY SIDEBAR TAB ########################################################################################################
                    dashboardBody(
                      tabItems(
                        
                        
                        ################## TAB: INTRODUCTION CONTENT  #########################################################################################################
                        
                        tabItem(tabName = "intro",
                                fluidPage(
                                  
                                  box(
                                    title= "Description", width = 12, status = "warning",
                                    "This page highlights some important principles of data visualization and provides a collection of basic tutorials.",
                                    br(),
                                    "Every topic is linked to existing online learning material that should be used to train you further.",
                                    br(),
                                    br(),
                                    icon = icon("th"), href = "http://data.unhcr.org/imtoolkit/"
                                  )
                                )
                        ),
                        
                        
                        ################## TAB: NICE TO KNOW ##################################################################################################################
                        
                        tabItem(tabName = "knowledge",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "tabset1", width = 12,
                                    tabPanel("General material about data visualization", uiOutput('viZ_links_general'), width = NULL),
                                    tabPanel("Classification Algorithms", uiOutput('classification'), width = NULL),
                                    tabPanel("Working with Colors", uiOutput('color'), width = NULL)
                                    
                                    
                                  )
                                )
                        ),
                        
                        ################## TAB: MAPPING #######################################################################################################################
                        
                        tabItem(tabName = "maps",
                                fluidRow(
                                  box( title="Mapping", width = 12, background = "teal"),
                                  column(width = 6,
                                         box( title= "Bubble Map", status = "primary",
                                              br(), 
                                              p("...")
                                         )),
                                  column(width = 6,
                                         box( title= "Choropleth Map", status = "warning",
                                              br(),
                                              p("...")
                                         ))
                                  
                                )
                        ),
                        
                        
                        
                        
                        
                        
                        ################## TAB: STATISTICAL ANANALYSIS ########################################################################################################
                        
                        ################## SUBTAB: PROBABILITY & STATISTICS ####################################
                        
                        tabItem(tabName = "statistics_prob",
                                fluidRow(
                                  box( width = 12, status = "primary",
                                       uiOutput('statprob'))
                                )
                        ),
                        
                        ################## SUBTAB: INTRODUCTORY ECONOMETRICS ###################################
                        
                        tabItem(tabName = "statistics_intro",
                                fluidRow(
                                  box( width = 12, status = "primary",
                                       uiOutput('introecon'))
                                )
                        ),
                        ################## SUBTAB: ADVANCED ECONOMETRICS #######################################
                        
                        tabItem(tabName = "statistics_adva",
                                fluidRow(
                                  box( width = 12, status = "primary",
                                       uiOutput('advanecon'))
                                )
                        ),
                        ################## SUBTAB: ECONOMETRICS FOR HUMANITARIAN ANALYSIS ######################
                        
                        tabItem(tabName = "statistics_huma",
                                fluidRow(
                                  box( width = 12, status = "primary",
                                       uiOutput('stathuman'))
                                )
                        ),
                        
                        
                        ################## TAB: ONLINE LEARNING ################################################################################################################
                        
                        
                        
                        
                        tabItem(tabName = "learning_statistics",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  box(width = 12, background = "teal", 
                                      fileInput('stat_software_comparison', 
                                                'Here you can open the Excel Workbook "Statistical Software Comparison',
                                                accept = c(".xlsx"))),
                                  tabBox(
                                    title= "",
                                    id = "Statistic", width = 12,
                                    tabPanel("Excel", dataTableOutput('table_excel_stat'), width = NULL),
                                    tabPanel("SPSS", dataTableOutput('table_spss'), width = NULL),
                                    tabPanel("Stata", dataTableOutput('table_stata'), width = NULL),
                                    tabPanel("PSPP", dataTableOutput('table_pspp'), width = NULL),
                                    tabPanel("Sas", dataTableOutput('table_sas'), width = NULL),
                                    tabPanel("R", dataTableOutput('table_r_stat'), width = NULL),
                                    tabPanel("Matlab", dataTableOutput('table_matlab_stat'), width = NULL)
                                  )
                                )
                        ),
                        
                        tabItem(tabName = "learning_mapping",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "Mapping", width = 12,
                                    tabPanel("ArcGIS Desktop", dataTableOutput('table_arcgis_desktop'), width = NULL),
                                    tabPanel("ArcGIS Online", width = NULL),
                                    tabPanel("Carto", dataTableOutput('table_carto'), width = NULL),
                                    tabPanel("QGIS", width = NULL),
                                    tabPanel("R in RStudio", width = NULL),
                                    tabPanel("R + dc.js", width = NULL),
                                    tabPanel("R + d3.js", width = NULL),
                                    tabPanel("R + leaflet", width = NULL),
                                    tabPanel("Google Earth", width = NULL),
                                    tabPanel("Google Maps API", width = NULL),
                                    tabPanel("Tableau", width = NULL),
                                    tabPanel("Microsoft Power BI", width = NULL),
                                    tabPanel("Excel Powermaps", width = NULL)
                                  )
                                )
                        ),
                        
                        tabItem(tabName = "learning_infographics",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "Infographics", width = 12,
                                    tabPanel("Excel", dataTableOutput('table_excel_infogr'), width = NULL),
                                    tabPanel("Power Bi", dataTableOutput('table_powerbi_infogr'), width = NULL),
                                    tabPanel("Tableau", dataTableOutput('table_tableau_infogr'), width = NULL),
                                    tabPanel("R", dataTableOutput('table_r_infogr'), width = NULL),
                                    tabPanel("SAS", dataTableOutput('table_sas_infogr'), width = NULL),
                                    tabPanel("Matlab", dataTableOutput('table_matlab_infogr'), width = NULL),
                                    tabPanel("Stata", dataTableOutput('table_stata_infogr'), width = NULL),
                                    tabPanel("SPSS", dataTableOutput('table_spss_infogr'), width = NULL),
                                    tabPanel("PSPP", dataTableOutput('table_pspp_infogr'), width = NULL)
                                  )
                                )
                        ),
                        
                        tabItem(tabName = "learning_image_processing",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "Image_Process", width = 12,
                                    tabPanel("Adobe Illustrator", width = NULL),
                                    tabPanel("Adobe Photoshop", width = NULL),
                                    tabPanel("GIMP", width = NULL)
                                  )
                                )
                        ),
                        
                        tabItem(tabName = "learning_reporting",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "Reporting", width = 12,
                                    tabPanel("Microsoft Word", width = NULL),
                                    tabPanel("Adobe Publisher", width = NULL),
                                    tabPanel("Adobe InDesign", width = NULL)
                                  )
                                )
                        ),
                        
                        tabItem(tabName = "learning_webdevelopment",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "",
                                    id = "Webdevelopment", width = 12,
                                    tabPanel("Adobe Muse", width = NULL),
                                    tabPanel("Adobe Dreamweaver", width = NULL),
                                    tabPanel("HTML, CSS, Javascript", width = NULL),
                                    tabPanel("R + ShinyPackage", width = NULL)
                                  )
                                )
                        ),
                        ################## TAB: SOFTWARE REVIEW #################################################################################################################
                        
                        tabItem(tabName = "software",
                                fluidRow(
                                  box( title = "DESCRIPTION", width = 12, background = "teal",
                                       "description"),
                                  tabBox(
                                    title= "", width = 12,
                                    id = "tabset1", height = "250px",
                                    tabPanel("Price", "First content"),
                                    tabPanel("Usability", "..."),
                                    tabPanel("Functionality Comparison", "..."))
                                )
                        )
                        
                        
                        ################## CLOSINGS #############################################################################################################################
                      ) #Closing dashboard items
                      
                    ) #Closing dashboard body
) #Closing dashboard page


