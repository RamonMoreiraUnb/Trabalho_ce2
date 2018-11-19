                                      ##PACOTES NECESSÁRIOS##
if (!require("pacman")) install.packages("pacman")
pacman:::p_load("tidyverse","readr", "ggrepel","reshape2", "devtools")
#setwd(choose.dir())
devtools::install_github('ramnathv/slidify', dependencies = TRUE)
install_github('ramnathv/slidifyLibraries')
library(slidify)

                                        ##BANCO DE DADOS##

Away_attendance_2014_15 <- read_csv("Away attendance 2014-15.csv")
Away_attendance_2015_16 <- read_csv("Away attendance 2015-16.csv")
Away_attendance_2016_17 <- read_csv("Away attendance 2016-17.csv")
Away_attendance_2017_18 <- read_csv("Away attendance 2017-18.csv")

Home_attendance_2014_15 <- read_csv("Home attendance 2014-15.csv")
Home_attendance_2015_16 <- read_csv("Home attendance 2015-16.csv")
Home_attendance_2016_17 <- read_csv("Home attendance 2016-17.csv")
Home_attendance_2016_17$`Avg Home Attendance`[Home_attendance_2016_17$`Avg Home Attendance`== 57974] <- 36557
Home_attendance_2016_17$`Total Home Attendance`[Home_attendance_2016_17$`Total Home Attendance`== 1101500] <- 695500
Home_attendance_2016_17$`Highest Home Attendance`[Home_attendance_2016_17$`Highest Home Attendance`== 451169] <- 53085
Home_attendance_2017_18 <- read_csv("Home attendance 2017-18.csv")

League_Nationalities_2014_15 <- read_csv("League Nationalities 2014-15.csv",col_types = cols(Team = col_skip()))
League_Nationalities_2014_15 <- League_Nationalities_2014_15 %>% 
  group_by(League) %>% 
  mutate(Porcentagem = Players/sum(Players))
League_Nationalities_2015_16 <- read_csv("League Nationalities 2015-16.csv",col_types = cols(Team = col_skip()))
League_Nationalities_2015_16 <- League_Nationalities_2015_16 %>% 
  group_by(League) %>% 
  mutate(Porcentagem = Players/sum(Players))
League_Nationalities_2016_17 <- read_csv("League Nationalities 2016-17.csv",col_types = cols(Team = col_skip()))
League_Nationalities_2016_17 <- League_Nationalities_2016_17 %>% 
  group_by(League) %>% 
  mutate(Porcentagem = Players/sum(Players))
League_Nationalities_2017_18 <- read_csv("League Nationalities 2017-18.csv",col_types = cols(Team = col_skip()))
League_Nationalities_2017_18 <- League_Nationalities_2017_18 %>% 
  group_by(League) %>% 
  mutate(Porcentagem = Players/sum(Players))

Player_Stats_2014_15 <- read_csv("Player Stats 2014-15.csv",
                                                                 col_types = cols(Away = col_integer(), 
                                                                                   Corner = col_integer(), Cross = col_integer(), 
                                                                                   `Direct Free Kick` = col_integer(), 
                                                                                   `First Half` = col_integer(), `First Scorer` = col_integer(), 
                                                                                   `Free Kick` = col_integer(), Header = col_integer(), 
                                                                                   Home = col_integer(), `Last Scorer` = col_integer(), 
                                                                                   `Left Foot` = col_integer(), `Open Play` = col_integer(), 
                                                                                   `Other Method` = col_integer(), `Other Type Of Play` = col_integer(), 
                                                                                   Penalty = col_integer(), `Red - Away` = col_integer(), 
                                                                                   `Red - First Half` = col_integer(), 
                                                                                   `Red - Home` = col_integer(), `Red - Second Half` = col_integer(), 
                                                                                   `Right Foot` = col_integer(), `Second Half` = col_integer(), 
                                                                                   `Straight Red Card` = col_integer(), 
                                                                                   `Throw In` = col_integer(), `Two Yellow Cards` = col_integer(), 
                                                                                   `Yellow - Away` = col_integer(), 
                                                                                   `Yellow - First Half` = col_integer(), 
                                                                                   `Yellow - Home` = col_integer(), 
                                                                                   `Yellow - Second Half` = col_integer()))
                                
Player_Stats_2015_16 <- read_csv("Player Stats 2015-16.csv",
                                 col_types = cols(Away = col_integer(), 
                                                  Corner = col_integer(), Cross = col_integer(), 
                                                  `Direct Free Kick` = col_integer(), 
                                                  `First Half` = col_integer(), `First Scorer` = col_integer(), 
                                                  `Free Kick` = col_integer(), Header = col_integer(), 
                                                  Home = col_integer(), `Last Scorer` = col_integer(), 
                                                  `Left Foot` = col_integer(), `Open Play` = col_integer(), 
                                                  `Other Method` = col_integer(), `Other Type Of Play` = col_integer(), 
                                                  Penalty = col_integer(), `Red - Away` = col_integer(), 
                                                  `Red - First Half` = col_integer(), 
                                                  `Red - Home` = col_integer(), `Red - Second Half` = col_integer(), 
                                                  `Right Foot` = col_integer(), `Second Half` = col_integer(), 
                                                  `Straight Red Card` = col_integer(), 
                                                  `Throw In` = col_integer(), `Two Yellow Cards` = col_integer(), 
                                                  `Yellow - Away` = col_integer(), 
                                                  `Yellow - First Half` = col_integer(), 
                                                  `Yellow - Home` = col_integer(), 
                                                  `Yellow - Second Half` = col_integer()))
Player_Stats_2016_17 <- read_csv("Player Stats 2016-17.csv",
                                 col_types = cols(Away = col_integer(), 
                                                  Corner = col_integer(), Cross = col_integer(), 
                                                  `Direct Free Kick` = col_integer(), 
                                                  `First Half` = col_integer(), `First Scorer` = col_integer(), 
                                                  `Free Kick` = col_integer(), Header = col_integer(), 
                                                  Home = col_integer(), `Last Scorer` = col_integer(), 
                                                  `Left Foot` = col_integer(), `Open Play` = col_integer(), 
                                                  `Other Method` = col_integer(), `Other Type Of Play` = col_integer(), 
                                                  Penalty = col_integer(), `Red - Away` = col_integer(), 
                                                  `Red - First Half` = col_integer(), 
                                                  `Red - Home` = col_integer(), `Red - Second Half` = col_integer(), 
                                                  `Right Foot` = col_integer(), `Second Half` = col_integer(), 
                                                  `Straight Red Card` = col_integer(), 
                                                  `Throw In` = col_integer(), `Two Yellow Cards` = col_integer(), 
                                                  `Yellow - Away` = col_integer(), 
                                                  `Yellow - First Half` = col_integer(), 
                                                  `Yellow - Home` = col_integer(), 
                                                  `Yellow - Second Half` = col_integer()))
Player_Stats_2017_18 <- read_csv("Player Stats 2017-18.csv",
                                 col_types = cols(Away = col_integer(), 
                                                  Corner = col_integer(), Cross = col_integer(), 
                                                  `Direct Free Kick` = col_integer(), 
                                                  `First Half` = col_integer(), `First Scorer` = col_integer(), 
                                                  `Free Kick` = col_integer(), Header = col_integer(), 
                                                  Home = col_integer(), `Last Scorer` = col_integer(), 
                                                  `Left Foot` = col_integer(), `Open Play` = col_integer(), 
                                                  `Other Method` = col_integer(), `Other Type Of Play` = col_integer(), 
                                                  Penalty = col_integer(), `Red - Away` = col_integer(), 
                                                  `Red - First Half` = col_integer(), 
                                                  `Red - Home` = col_integer(), `Red - Second Half` = col_integer(), 
                                                  `Right Foot` = col_integer(), `Second Half` = col_integer(), 
                                                  `Straight Red Card` = col_integer(), 
                                                  `Throw In` = col_integer(), `Two Yellow Cards` = col_integer(), 
                                                  `Yellow - Away` = col_integer(), 
                                                  `Yellow - First Half` = col_integer(), 
                                                  `Yellow - Home` = col_integer(), 
                                                  `Yellow - Second Half` = col_integer()))

Tables_2014_15 <- read_csv("Tables 2014-15.csv",col_types = cols(D = col_integer(), L = col_integer(), 
                                                                W = col_integer()))
Tables_2015_16 <- read_csv("Tables 2015-16.csv",col_types = cols(D = col_integer(), L = col_integer(), 
                                                                 W = col_integer()))
Tables_2016_17 <- read_csv("Tables 2016-17.csv",col_types = cols(D = col_integer(), L = col_integer(), 
                                                                 W = col_integer()))
Tables_2017_18 <- read_csv("Tables 2017-18.csv",col_types = cols(D = col_integer(), L = col_integer(), 
                                                                 W = col_integer()))

Team_Defense_2014_15 <- read_csv("Team Defense 2014-15.csv")
Team_Defense_2015_16 <- read_csv("Team Defense 2015-16.csv")
Team_Defense_2016_17 <- read_csv("Team Defense 2016-17.csv")
Team_Defense_2017_18 <- read_csv("Team Defense 2017-18.csv")

Team_Offense_2014_15 <- read_csv("Team Offense 2014-15.csv")
Team_Offense_2015_16 <- read_csv("Team Offense 2015-16.csv")
Team_Offense_2016_17 <- read_csv("Team Offense 2016-17.csv")
Team_Offense_2017_18 <- read_csv("Team Offense 2017-18.csv")

#UNINDO BANCO DE DADOS POR CATEGORIA

All_away_attendance <- rbind(Away_attendance_2014_15,
                             Away_attendance_2015_16,
                             Away_attendance_2016_17,
                             Away_attendance_2017_18)

All_home_attendance <- rbind(Home_attendance_2014_15, 
                             Home_attendance_2015_16,
                             Home_attendance_2016_17,
                             Home_attendance_2017_18)

All_league_nationalities <- rbind(League_Nationalities_2014_15,
                                  League_Nationalities_2015_16,
                                  League_Nationalities_2016_17,
                                  League_Nationalities_2017_18)

All_player_stats <- rbind(Player_Stats_2014_15,
                          Player_Stats_2015_16,
                          Player_Stats_2016_17,
                          Player_Stats_2017_18)

All_tables <- rbind(Tables_2014_15,
                    Tables_2015_16,
                    Tables_2016_17,
                    Tables_2017_18)

All_team_defense <- rbind(Team_Defense_2014_15,
                          Team_Defense_2015_16,
                          Team_Defense_2016_17,
                          Team_Defense_2017_18)

All_tem_offense <- rbind(Team_Offense_2014_15,
                         Team_Offense_2015_16,
                         Team_Offense_2016_17,
                         Team_Offense_2017_18)

#Selecionando as 5 maiores ligas.

top_5 <- function(x){
  filter(x, League != "Eredivisie"& League != "Scottish Premiership")
  }

All_away_attendance <- top_5(All_away_attendance)
All_home_attendance <- top_5(All_home_attendance)
All_league_nationalities <- top_5(All_league_nationalities)
All_player_stats <- top_5(All_player_stats)
All_tables <- top_5(All_tables)
All_team_defense <- top_5(All_team_defense)
All_tem_offense <- top_5(All_tem_offense)

                                     ##ANÁLISE GRÁFICA##

#COMPARANDO AS LIGAS NOS ÚLTIMOS 4 ANOS, DE ACORDO COM A PONTUAÇÃO DOS TIMES.

###Por pontos###
temporada_compl <- filter(All_tables, `Table Type` == "League Table")

ggplot(data = temporada_compl, aes(League, Pts))+
  geom_boxplot(fill= "orangered3")+
  facet_wrap(~Season, ncol = 2)+
  theme_minimal()

###GOLS MARCADOS E SOFRIDOS###
#FAZER UM QUIZ#
ggplot(data = temporada_compl, aes(`F`, A))+
  geom_point(aes(color= Season), size = 3)+
  theme_minimal()+
  geom_smooth(method = lm, se = F, color = "red", size = 2)+
  labs(x = "Gols marcados", y = "Gols sofridos")+
  geom_text_repel(
    data = filter(temporada_compl, GD > 79| GD < -50),
    aes(`F`, A,label= Team),box.padding = unit(0.5, "lines"))
  

cor.test(temporada_compl$F, temporada_compl$A)

#ggplot(data = temporada_compl, aes(`F`, A))+
 #geom_point()+
  #theme_minimal()+
  #geom_smooth(method = lm, se = F, color = "red", size = 2)+
  #labs(x = "Gols marcados", y = "Gols sofridos")+
  #geom_text_repel(
    #data = filter(temporada_compl, GD > 78| GD < -50),
    #aes(`F`, A,label= GD, hjust= -0.1),box.padding = unit(0.5, "lines"))





###MEDIA POR PARTIDA###

gols_partida <- temporada_compl %>% 
  group_by(Season) %>% 
  group_by(Team) %>% 
  mutate(mfei = `F`/P) %>% 
  mutate(msof = A/P)

ggplot(data = gols_partida, aes(mfei, msof))+
  geom_point()+
  theme_minimal()+
  geom_smooth(method = lm, se = F, color = "red", size = 2)+
  labs(x = "Gols marcados", y = "Gols sofridos")+
  geom_text_repel(
    data = filter(gols_partida, GD > 78| GD < -50),
    aes(mfei, msof,label= Team, hjust= -0.1),box.padding = unit(0.5, "lines"))


#NACIONALIDADES DOS JOGADORES POR LIGA

##MOVIMENTAÇÃO DOS BR

ggplot(data= filter(All_league_nationalities, Country == "Brazil"))+
      geom_bar(aes(x = reorder(League, Players, FUN = sum),Players), stat = "identity")


ggplot(data= filter(All_league_nationalities, Country == "Brazil"))+
  geom_bar(aes(Season,Players, fill = League), stat = "identity")+
  facet_wrap(~League)+
  theme(legend.position = "none")+
  labs(title = "Movimentação dos brasileiros nas principais ligas", x = "Temporada", y = "Número de brasileiros")+
  scale_fill_brewer(palette = 6, type = "qual")

##GERAL
#PORCENTAGEM DE JOGADORES DO PAIS EM SUA RESPECTIVA LIGA
ggplot(maisde25)+
  geom_bar(aes(x = reorder(League, Porcentagem,FUN = sum),Porcentagem, fill = League), stat= "identity")+
  facet_wrap(~Season)+
  theme(legend.position = "none")

  

maisde25 <- All_league_nationalities %>% 
  filter(Porcentagem > 0.1)


##ANALISAR OS MAIORES ATAQUES NOS ÚLTIMOS 4 ANOS

pos <-  All_tables %>% 
  filter(`Table Type` == "League Table") %>% 
  select(Season, Team , Pos)

atk <- All_tem_offense %>% 
  filter(`GF Per Match`> 2.5) %>% 
  group_by(Team) %>% 
  mutate(P_Home = (`GF Home`/(`GF Home`+ `GF Away`))) %>% 
  mutate(P_Away = (1- P_Home)) %>% 
  mutate(PF = `GF First Half`/(`GF First Half`+ `GF Second Half`)) %>% 
  mutate(PS = 1- PF) %>% 
  mutate(PF15 = `GF First 15 mins`/`GF First Half`) %>% 
  mutate(PS10 = `GF Last 10 mins`/ `GF Second Half`)

atk <- merge(atk, pos)



#ATAQUE

ggplot(atk)+
  geom_bar(aes(x = reorder(Team,-`GF Per Match`, FUN = mean),  P_Away, fill = Season), stat = "identity", position = "dodge")+
  geom_text(
    aes(x = Team, y = P_Away, label = Pos, group = Season),
    position = position_dodge(width = 1),
    vjust = -0.5, size = 3)

#CONTRA ATAQUE

ggplot(atk)+
  geom_bar(aes(Team, PS10, fill = Season), stat = "identity", position = "dodge")

#MEDIA DE GOLS

ggplot(data = All_tem_offense, mapping = aes(x = `GF Per Match`)) +
  geom_freqpoly(aes(color = League),binwidth = 0.6)+
  facet_wrap(~Season)

##MELHORES DEFESAS
#SELECIONANDO E CRIANDO VERIFICADORES

df <- All_team_defense %>% 
  filter(`GA Per Match`< 0.7) %>% 
  group_by(Team) %>% 
  mutate(P_Home = (`GA Home`/(`GA Home`+ `GA Away`))) %>% 
  mutate(P_Away = (1- P_Home)) %>% 
  mutate(PF = `GA First Half`/(`GA First Half`+ `GA Second Half`)) %>% 
  mutate(PS = 1- PF)

#UNINDO COM AS POSIÇÕES  E TRANSFORMANDO UMA COLUNA EM INTEIROS

df <- merge(df, pos)

df$`GA Last 10 mins` <- parse_integer(df$`GA Last 10 mins`)

df$`GA Last 10 mins`[is.na(df$`GA Last 10 mins`)] <- 0

#CRIANDO UM INDICADOR

df <- df %>% 
  group_by(Team) %>% 
  mutate(PS10 = `GA Last 10 mins`/ `GA Second Half`)

#CRIANDO GRÁFICOS

ggplot(df)+
  geom_bar(aes(Team, PS10, fill = Season), stat = "identity", position = "dodge")+
  geom_text(
    aes(x = Team, y = PS10, label = Pos, group = Season),
    position = position_dodge(width = 1),
    vjust = -0.5, size = 3)


#ANALISANDO SE O PÚBLICO INFLUENCIA EM UM BOM CAMPEONATO

ggplot(All_home_attendance)+
  geom_boxplot(aes(x = reorder(League, -`Avg Home Attendance`, FUN =  median), `Avg Home Attendance`))+
  facet_wrap(~Season)+
  theme_bw()+
  theme(strip.background =element_rect(fill="red"))+
  theme(strip.text = element_text(colour = 'white'))
  

                      ##Análise dos jogadores##



#Quem recebeu mais amarelos

All_player_stats$`Yellow Cards` <- parse_integer(All_player_stats$`Yellow Cards`)

ggplot(data = filter(All_player_stats, `Yellow Cards`> 0))+
  geom_boxplot(aes(Position, `Yellow Cards`))+
  facet_wrap(~League)+
  geom_text_repel(
    data = filter(All_player_stats, `Yellow Cards`> 12 & Position == "Forward"),
    aes(Position, `Yellow Cards`,label= Player),box.padding = unit(0.5, "lines"))


#Separando os jogadores dos times

jogadores <- All_player_stats %>% 
  filter(`Type Of Goal`== "Player")


#ARTILHEIROS

ggplot(data = filter(jogadores, Goals >10))+
  geom_boxplot(aes(League, Goals))+
  facet_wrap(~Season)+
  geom_text_repel(
    data = filter(jogadores, Goals>30),
    aes(League, Goals,label= Player, color = Season),box.padding = unit(0.5, "lines"))
  


#ASSISTENCIAS

ggplot(data = filter(jogadores, Assists > 3))+
         geom_boxplot(aes(League, Assists))+
         facet_wrap(~Season)+
         geom_text_repel(
           data = filter(jogadores, Assists>15),
           aes(League, Assists,label= Player, color = Team),box.padding = unit(0.5, "lines"))

ggplot(data = filter(jogadores, Assists > 15))+
  geom_bar(aes(x = reorder(Player, `% Assists`, FUN = median), `% Assists`,alpha = Season, color = `Leading Recipient`),
           stat = "identity", position = "dodge")+
  coord_flip()
#Maiores artilheiros

Strikers <- All_player_stats %>% 
  filter(is.na(Player) == F) %>% 
  filter(Goals > 30 & (Goals != 34 & Goals != 37 & Goals != 35)) %>% 
  select(League:Season, Player, Goals, `First Half`:`Hat Tricks`) %>% 
  select(-`First Scorer`, -`Last Scorer`,-`Throw In`, -(`% Assists`:`% Clean Sheets`))
  
#MOMENTO DO GOL
Method <- Strikers %>% 
  select(League:Goals, `Right Foot`:`Other Method`) %>% 
  melt(id.vars = 1:5, variable.name = "Metodo", value.name = "Goal" )
  
  
Type <- Strikers %>% 
  select(League:Goals, Cross:`Other Type Of Play`) %>% 
  melt(id.vars = 1:5, variable.name = "Type Of Play", value.name = "Goal" )

Open <- Strikers %>% 
  select(League:Goals, `Open Play`) %>% 
  group_by(Player) %>% 
  mutate(Porcentagem = `Open Play`/Goals) %>% 
  mutate(parada = Goals - `Open Play`)

parada <- select(Open, parada)

Type <-  merge(Type, parada, by= "Player")
#GRAFICOS COMPARANDO

#Metodo da finalização

ggplot(Method, aes(x = reorder(Player, -Goals, FUN = sum), Goal, fill = Metodo))+
  geom_bar(stat = "identity", position = "dodge")

#Tipo do gol

ggplot(Type, aes(x = reorder(Player, -Goals, FUN = sum), Goal, fill = `Type Of Play`))+
  geom_bar(stat = "identity", position = "dodge")

ggplot(Open, aes(x = reorder(Player, -Porcentagem, FUN = sum), Porcentagem))+
  geom_bar(stat = "identity", position = "dodge")

#MINUTOS POR GOL

ggplot(Strikers)+
  geom_bar(aes(Player, `Min/goal`), stat = "identity")


#GOLEIROS

ggplot(data = filter(All_player_stats, Appearances > 10))+
  geom_boxplot(aes(League, CS))+
  facet_wrap(~Season)+
  geom_text_repel(data =filter(All_player_stats, CS > 17), aes(League, CS, label = Player)
                  ,box.padding = unit(0.5, "lines"))








sum(teste$Players)

ggplot()+
  geom_boxplot(data= filter(ab, Goals>5), aes(X.U.FEFF.League, Goals, color=X.U.FEFF.League))+
  geom_text_repel(
    data = filter(ab, Goals>25),
    aes(X.U.FEFF.League, Goals,label= Player, hjust= -0.1),box.padding = unit(0.5, "lines"))
    
  geom_text(data= filter(ab, Goals>25), aes(X.U.FEFF.League, Goals,label= Player, hjust= -0.1),box.padding = unit(0.5, "lines") )
  

ab <- filter(a, !is.na(Started))
ab <- filter(ab, X.U.FEFF.League != "Scottish Premiership")

max(Home_attendance_2014_15$`Highest Home Attendance`)



library(ggrepel)
