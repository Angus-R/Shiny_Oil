#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    low <- reactive({
        as.numeric(input$low)
    })

    high <- reactive({
        as.numeric(input$high)
    })
    
    lowa <- reactive({
        as.numeric(input$lowa)
    })
    
    higha <- reactive({
        as.numeric(input$higha)
    })
    
    
    output$lead <- renderPlot({
        
        # low <- input$low
        # high <- input$high
        lead_cu_spread <- df %>% filter(between(per_close, low(),high()))
        lead_cu_spread <- setDT(lead_cu_spread[,c(1,3,8:17)])   # lead columns
        lead_cu_melt <- melt(lead_cu_spread, id.vars = "Date")
        le_cu_box <- lead_cu_melt %>% 
            ggplot(aes(x = variable, y = value, fill = variable, alpha = 0.5))+
            geom_boxplot()+
            scale_fill_viridis_d("red")+
            geom_jitter(color = "black", size = 0.1, alpha = 0.9, width = 0.2)+
            ggtitle(paste0("Future values based on % range of move ", low(), "% to ", high(), "%"))+
            labs(subtitle = "Tool to visualize market movement after a user defined shock"
                 , caption = "WTI hourly data April - September 2020 ")+
            scale_x_discrete(name = "Number of hours after move", breaks = c("per_close","lead_1","lead_2","lead_3","lead_4","lead_5",
                                                                             "lead_6","lead_7","lead_8","lead_9","lead_10"),
                             labels = c("0","1h","2h","3h","4h","5h",
                                        "6h","7h","8h","9h","10h"))+
            scale_y_continuous(name = "% change in value")+
            theme(legend.position = "None")
        le_cu_box
        
    })
    ####---------
    
    
    
    output$average <- renderPlot({

        ave_cu_spread <- df %>% filter(between(per_close, lowa(),higha()))
        ave_cu_spread <- setDT(ave_cu_spread[,c(1,3,18:27)])   # average columns
        ave_cu_melt <- melt(ave_cu_spread, id.vars = "Date")
        av_cu_box <- ave_cu_melt %>%
            ggplot(aes(x = variable, y = value, fill = variable, alpha = 0.5))+
            geom_boxplot()+
            scale_fill_viridis_d()+
            geom_jitter(color = "black", size = 0.1, alpha = 0.9, width = 0.2)+
            ggtitle(paste0("Averaged future values based on % range of move ", lowa(), "% to ", higha(), "%"))+
            labs(subtitle = "Tool to visualize time averaged market movement after a user defined shock"
                 , caption = "WTI hourly data April - September 2020 ")+
            scale_x_discrete(name = "Number of hours after move", 
                             breaks = c("per_close","ave_1","ave_2","ave_3","ave_4","ave_5",
                                       "ave_6","ave_7","ave_8","ave_9","ave_10"),
                             labels = c("0","1h","2h","3h","4h","5h",
                                        "6h","7h","8h","9h","10h"))+
            scale_y_continuous(name = "% change in value")+
            theme(legend.position = "None")
        av_cu_box

    })
    
    output$table <- DT::renderDT({df})
    
    })
