
## ------------------------------------------------------------------------
load("Data_Subs_Merge.RData")


## ----, eval = FALSE------------------------------------------------------
## install.packages("dplyr")


## ----, message=FALSE-----------------------------------------------------
library(dplyr)


## ------------------------------------------------------------------------
summary(mydata2)


## ----, eval=FALSE--------------------------------------------------------
## summary(mydata2)


## ----, eval=FALSE--------------------------------------------------------
## mydata2 %>% summary


## ------------------------------------------------------------------------
mydata2 %>% na.omit %>% summary


## ----, eval=FALSE--------------------------------------------------------
## mydata2 %>% na.omit %>% summary


## ----, eval = FALSE------------------------------------------------------
## summary(na.omit(mydata2))


## ----, eval = FALSE------------------------------------------------------
## summary(mydata2, digits = 1)


## ----, eval = FALSE------------------------------------------------------
## mydata2 %>% summary(digits = 1)


## ------------------------------------------------------------------------
data7


## ------------------------------------------------------------------------
aggregate(math.score ~ id.school + gender, data = data7, 
          FUN = function(x) c(M = mean(x), SD = sd(x)))



## ----, eval = FALSE------------------------------------------------------
## do.call(rbind,
##         args = lapply(split(data7, list(data7$gender, data7$id.school)),
##           FUN = function(x) {
##            x$diff = x$math.score - mean(x$math.score)
##            return(x)
##        }))
## 


## ------------------------------------------------------------------------
data7 %>% arrange(gender, math.score)


## ------------------------------------------------------------------------
data7 %>% filter(math.score < 600)


## ------------------------------------------------------------------------
data7 %>% filter(gender == 1, math.score < 600)


## ------------------------------------------------------------------------
data7 %>% 
   summarize(M = mean(math.score),
             SD = sd(math.score))


## ------------------------------------------------------------------------
data7 %>% group_by(id.school) %>%                    
  summarize(M = mean(math.score), SD = sd(math.score))


## ------------------------------------------------------------------------
data7 %>% group_by(id.school, gender) %>%         
  summarize(M = mean(math.score),
            SD = sd(math.score))


## ------------------------------------------------------------------------
data7 %>% 
  mutate(M = mean(math.score),
         SD = sd(math.score))


## ------------------------------------------------------------------------
data7 %>% group_by(id.school) %>%                   
  mutate(M = mean(math.score),
         SD = sd(math.score))


## ------------------------------------------------------------------------
data7 %>% group_by(id.school, gender) %>%                      
  mutate(M = mean(math.score),
         diff.from.mean = math.score - M)


## ----, eval = FALSE------------------------------------------------------
## vignette("magrittr", package = "magrittr")
## vignette("introduction", package = "dplyr")

