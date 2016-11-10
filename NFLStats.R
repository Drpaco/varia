# library(devtools)
# 
# devtools::install_github(repo = "maksimhorowitz/nflscrapR")

library(nflscrapR)
#d = season_games(2015)
d2016 = season_games(2016,Weeks=8)
d21 = season_player_game(2016,Weeks=8)
#str(d2)
#t = d2[d2$Team=='JAC',]
d21$Team = as.character(d21$Team)
d21$Team = ifelse(d21$Team=='JAC','JAX',d21$Team)

#off by games
#names(d2)
#stats = c("passyds","pass.tds","rushyds","rushtds")
d2games = aggregate(cbind(passyds,pass.tds,rushyds,rushtds)~game.id+Team,d21,sum,na.rm=TRUE)

#merge to associate def stats
d2tot = merge(d2games,d2016,by.x="game.id",by.y="GameID")
names(d2tot)
#create 1-2 var by game
library(plyr)
d2tot = ddply(d2tot, .(game.id), mutate, team12 = seq_along(passyds))
require(reshape2)
d2t = dcast(d2tot,game.id ~ team12, value.var="passyds")



library(reshape)
td2 <- data.frame(cast(d2tot,game.id~team12,value=c("rushyds","passyds")))



#average stats
  # team.ave = aggregate(cbind(passyds,pass.tds,rushyds,rushtds)~Team,d2games,sum,na.rm=TRUE)
  # team.ave = team.ave[order(team.ave$passyds),]
  # team.ave$pyr = 1:nrow(team.ave)

#team.ave$pyr = team.ave$pyr  * (team.ave$passyds/mean(team.ave$passyds))

#compute defense stats




###analysis of games 
library(ggplot2)

ggplot(team.ave, aes(x=xvar, y=yvar, color=cond)) + geom_point(shape=1)

ggplot(p2df, aes(p2df$dayofyear)) + 
  geom_histogram(col="darkgray", 
                 aes(fill=..count..),
                 boundary = -0.5,
                 breaks=(seq(112,319,by=7)))+
  scale_fill_gradient("no. of obs.", low = "white", high = "darkgreen") + 
  scale_x_continuous(labels=function(x) format(as.Date(as.character(x),"%j"),"%d-%b"))+
  xlab("Day of the year") +
  ylab("Grid cell-day") + 
  guides(fill=FALSE) +
  theme_bw()+
  theme(axis.text=element_text(size=18), 
        axis.title=element_text(size=24,face="bold"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))