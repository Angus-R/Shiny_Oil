#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(navbarPage("Visualizing Volatility with R",
                   
                   ##############   Layout(sidebarPanel, mainPanel) !!!!!!!!!!!!!!
                   tabPanel("% change hours after market move",
                            
                            fluidRow(column(12,
                                            h1("Hourly volatility of WTI Oil"),
                                            p("April-September 2020")),
                                     hr()
                            ),
                            sidebarPanel(width = 3, 
                                         sliderInput("low","Set min %", 
                                                     min = -4, max = 4,
                                                     value = 1.5, ticks = T, step = 0.5),
                                         sliderInput("high", "Set max %",
                                                     min = -4, max = 4,
                                                     value = 2.5, ticks = T, step = 0.5)),
                            mainPanel(plotOutput("lead", height = 600))
                            
                   )#TabPan1
                   ,


                   tabPanel("Averaged % change hours after market move",
                            fluidRow(column(12,
                                            h1("Averaged Hourly volatility of WTI Oil"),
                                            p("April-September 2020")),
                                     hr()
                            ),
                            sidebarPanel(width = 3,
                                         sliderInput("lowa","Set min %", min = -4, max = 4,
                                                     value = -3, ticks = T, step = 0.5),
                                         sliderInput("higha", "Set max %",
                                                     min = -4, max = 4,
                                                     value = -2, ticks = T, step = 0.5)),
                            mainPanel(plotOutput("average", height = 600))

                   )#Tab Pan2
                   ,
                   tabPanel("Data Table",
                             fluidRow(column(12,
                                             h1("Search/Filter data table"),
                                                p("WTI 2020")),
                                      hr()
                                      ),
                              mainPanel(DT::dataTableOutput("table"))
                   )#Tab Pan 3
                   ,
                   tabPanel("Why this App?",
                            fluidRow(column(12,
                                            h1("Scope of use for this type of app"),
                                            p("There is a small universe of different trading strategies. However, one convenient way of categorizing them
                                              is convergence vs divergence trading. This app (with other data sets) provides convergence traders with the
                                              ability to quickly consider the risk/reward profile for a chosen asset (in this example WTI oil). Typically a 
                                              day trader tries to exploit abrupt movements and or resistance levels in conjunction with financial products 
                                              (often with leverage) that allow him/her to go long or short the market. Traders will often use a combination 
                                              of 5min, 15min, 1hr, 4h and 24hr charts to assess a good time to enter the market. Skilled day traders can 
                                              make considerable profits this way."),
                                            p("The value of this app can be demonstrated with the following example. Imagine you get an alert that oil 
                                              has surged/fallen 2% in the past hour (or other time period). As a potential trader in this market you 
                                              would like to know how often this has happened in your entire dataset. You would also like to know how 
                                              the market typically responds to such a shock both in percentage point moves and averaged percentage point moves. This app allows the user to avoid a tendency for short 
                                              term bias of thinking to make a more informed decision as to the likely market response to the move. 
                                              By extension you can thereby take a statistically more informed position in the market. A more rigorous 
                                              statistical analysis going beyond the simple boxplot could be performed for different percentiles to 
                                              further inform a trader (probably my next app)."),
                                            p("The use of boxplots in combination with individual data points (the black dots) gives the user a 
                                              powerful and intuitive sense of how much data exists to support the boxplot position. As is always the
                                              case, less data makes conclusions more risky, but also more profitable if the trader takes a “correct” 
                                              position."),
                                            p("If you would like to know more contact me at tsubs{at}waywithwords.se")),
                                              hr()
                            ),
                            mainPanel("Hourly gold Sept - Oct 2020", img(src='wti.png', width = "150%"), p("TradingView.com"), hr() )
                   )
                   
)    #Title
)    #Nav


# 
# 
# tabPanel("Tab 3"),
# tabPanel("Tab 4")

