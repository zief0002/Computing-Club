## ----echo = F------------------------------------------------------------

inputPanel(
    sliderInput("mybin0", "Bin Width", 100, 1000, value = 500)
)

renderPlot({
ggplot(data = diamonds2, aes(x = price)) + 
  geom_histogram(binwidth = input$mybin0)
})


## ----message=FALSE-------------------------------------------------------
library(manipulate)

## ----message=FALSE, warning=FALSE----------------------------------------
library(ggplot2)

## Filter diamonds to reasonable subset 

diamonds2 = subset(diamonds, x > 0)
  

## ----echo = F------------------------------------------------------------
## Code to change text size for presentation

theme_set(theme_bw(base_size = 30))



## ------------------------------------------------------------------------
ggplot(diamonds2, aes(x = x, y = carat)) +
  geom_point(alpha = 0.5)


## ----eval = F------------------------------------------------------------
## manipulate({
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##   geom_point(alpha = myalpha)
##   },
##   myalpha = slider(min = 0, max = 0.5, initial = 0.25)
## )
## 

## ----eval = F------------------------------------------------------------
## 
## manipulate({
##   subdiamonds = subset(diamonds2, cut == mycut)
## 
##   ggplot(subdiamonds, aes(x = x, y = carat)) +
##   geom_point(alpha = myalpha)
##   },
##   myalpha = slider(min = 0, max = 0.5, initial = 0.25),
##   mycut = picker("Fair", "Good", "Very Good", "Premium", "Ideal")
## )
## 

## ----eval = F------------------------------------------------------------
## 
## ## Zoom in on a particular region of plot
## manipulate({
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##     geom_point(alpha = myalpha) +
##     coord_cartesian(xlim = c(xmin, xmax)) +
##     theme_bw(base_size = textsize)
## },
##   myalpha = slider(0, 1, initial = 0.5),
##   xmin = slider(0, 11, initial = 0),
##   xmax = slider(0, 11, initial = 11),
##   textsize = slider(10, 100, initial = 20)
## )
## 

## ----eval = F------------------------------------------------------------
## 
## manipulate( {
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##     geom_point() +
##     geom_smooth(method = "lm", formula = y ~ poly(x, deg)) +
##     ggtitle(paste("Fit with polynomial of degree", deg))
## },
##   deg = slider(1, 10))
## 

## ----eval = F------------------------------------------------------------
## 
## manipulate({
## ggplot(data = diamonds2, aes(x = price)) +
##   geom_histogram(binwidth = mybin)
## },
##   mybin = slider(100, 1000, initial = 500))
## 

## ----eval = F------------------------------------------------------------
## renderPlot({
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##   geom_point(alpha = input$myalpha)
##   })
## 
## inputPanel(
##   sliderInput("myalpha", label = "Alpha value:",
##               min = 0, max = 0.5, value = 0.25)
## )
## 
## 

## ----echo = F------------------------------------------------------------
renderPlot({
  ggplot(diamonds2, aes(x = x, y = carat)) +
  geom_point(alpha = input$myalpha)
  })

inputPanel(
  sliderInput("myalpha", label = "Alpha value:",
              min = 0, max = 0.5, value = 0.25)
)



## ----eval = F------------------------------------------------------------
## inputPanel(
##   sliderInput("myalpha2", "Alpha:",
##               min = 0, max = 0.5, value = 0.25),
##   selectInput("mycut2", "Cut:",
##               choices = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
##   )
## 
## renderPlot({
##   subdiamonds = subset(diamonds2, cut == input$mycut2)
## 
##   ggplot(subdiamonds, aes(x = x, y = carat)) +
##   geom_point(alpha = input$myalpha2)
##   }
## )
## 
## 
## 

## ----echo = F------------------------------------------------------------
inputPanel(
  sliderInput("myalpha2", "Alpha:",
              min = 0, max = 0.5, value = 0.25),
  selectInput("mycut2", "Cut:", 
              choices = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
  )

renderPlot({
  subdiamonds = subset(diamonds2, cut == input$mycut2)
  
  ggplot(subdiamonds, aes(x = x, y = carat)) +
  geom_point(alpha = input$myalpha2)
  }
)




## ----eval = F------------------------------------------------------------
## 
## inputPanel(
##   sliderInput("myalpha3", "Alpha", 0, 1, value = 0.5),
##   sliderInput("xmin3", "Minimum", 0, 11, value = 0),
##   sliderInput("xmax3", "Max", 0, 11, value = 11),
##   sliderInput("textsize3", "Text Size:", 10, 100, value = 20)
##   )
## 
## ## Zoom in on a particular region of plot
## renderPlot({
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##     geom_point(alpha = input$myalpha3) +
##     coord_cartesian(xlim = c(input$xmin3, input$xmax3)) +
##     theme_bw(base_size = input$textsize3)
## })
## 

## ----echo = F------------------------------------------------------------

inputPanel(
  sliderInput("myalpha3", "Alpha", 0, 1, value = 0.5),
  sliderInput("xmin3", "Minimum", 0, 11, value = 0),
  sliderInput("xmax3", "Max", 0, 11, value = 11),
  sliderInput("textsize3", "Text Size:", 10, 100, value = 20)
  )

## Zoom in on a particular region of plot
renderPlot({
  ggplot(diamonds2, aes(x = x, y = carat)) +
    geom_point(alpha = input$myalpha3) +
    coord_cartesian(xlim = c(input$xmin3, input$xmax3)) +
    theme_bw(base_size = input$textsize3)
})


## ----eval = F------------------------------------------------------------
## inputPanel(
##   sliderInput("deg", "Polynomial Degree", 1, 10, value = 1)
##   )
## 
## renderPlot( {
##   ggplot(diamonds2, aes(x = x, y = carat)) +
##     geom_point() +
##     geom_smooth(method = "lm", formula = y ~ poly(x, input$deg)) +
##     ggtitle(paste("Fit with polynomial of degree", input$deg))
## })
## 

## ----echo = F------------------------------------------------------------
inputPanel(
  sliderInput("deg", "Polynomial Degree", 1, 10, value = 1)
  )

renderPlot( {
  ggplot(diamonds2, aes(x = x, y = carat)) +
    geom_point() + 
    geom_smooth(method = "lm", formula = y ~ poly(x, input$deg)) +
    ggtitle(paste("Fit with polynomial of degree", input$deg))
})


## ----eval = F------------------------------------------------------------
## 
## inputPanel(
##     sliderInput("mybin", "Bin Width", 100, 1000, value = 500)
## )
## 
## renderPlot({
## ggplot(data = diamonds2, aes(x = price)) +
##   geom_histogram(binwidth = input$mybin)
## })
## 

## ----echo = F------------------------------------------------------------

inputPanel(
    sliderInput("mybin", "Bin Width", 100, 1000, value = 500)
)

renderPlot({
ggplot(data = diamonds2, aes(x = price)) + 
  geom_histogram(binwidth = input$mybin)
})


## ----echo = F------------------------------------------------------------

sidebarPanel(
  checkboxGroupInput('show_vars', 'Columns in diamonds to show:',
                     c("carat", "x", "price"),
                       selected = c("carat", "x", "price"))
  )

renderDataTable({
  diamonds2[, input$show_vars, drop = FALSE]
  },
  options = list(pageLength = 5)
  )


