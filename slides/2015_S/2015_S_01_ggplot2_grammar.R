## ------------------------------------------------------------------------
library(ggplot2)
head(diamonds)

## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = x, y = carat)) +
  geom_point()

## ----, eval=FALSE--------------------------------------------------------
## ggplot(data=diamonds, aes(x = x, y = carat)) +
##   geom_point()

## ----, eval=FALSE--------------------------------------------------------
## ggplot() +
##   layer(data = diamonds, mapping = aes(x = x, y = carat),
##                  geom = "point", stat = "identity", pos = "identity") +
##   scale_x_continuous() +
##   scale_y_continuous() +
##   coord_cartesian() +
##   theme()

## ----, eval=FALSE--------------------------------------------------------
## ggplot(diamonds, aes(x,carat)) +
##   geom_point()

## ----, eval=FALSE--------------------------------------------------------
## ggplot(data = economics, aes(x = date, y = pop)) +
##   geom_line()

## ------------------------------------------------------------------------
ggplot(data = economics, aes(x = date, y = pop)) + 
  geom_line()

## ----, eval=FALSE--------------------------------------------------------
## ggplot(data = diamonds, aes(x = price)) +
##   geom_histogram()
## 

## ----, message=FALSE-----------------------------------------------------
ggplot(data = diamonds, aes(x = price)) + 
  geom_histogram()


## ----, message=FALSE-----------------------------------------------------
ggplot(data = diamonds, aes(x = price)) + 
  geom_histogram(aes(y = ..density..)) + geom_density(color = "red")


## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar()

## ------------------------------------------------------------------------
library(RColorBrewer)
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() + scale_fill_brewer()

## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() + scale_fill_brewer() + 
  coord_flip()

## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar(position = "dodge") + scale_fill_brewer()

## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() + scale_fill_brewer() + facet_wrap(~cut)

## ------------------------------------------------------------------------
ggplot(data=diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() + scale_fill_brewer() +  facet_wrap(~cut) + theme_bw()

## ----, echo=FALSE--------------------------------------------------------
df <- data.frame(
  variable = c("resembles", "does not resemble"),
  value = c(80, 20)
)

## ------------------------------------------------------------------------
ggplot(df, aes(x = "", y = value, fill = variable)) + geom_bar(width = 1,
stat = "identity") + scale_fill_manual(values = c("red", "yellow")) +
  coord_polar("y", start = pi / 3) + labs(title = "Pac man")

