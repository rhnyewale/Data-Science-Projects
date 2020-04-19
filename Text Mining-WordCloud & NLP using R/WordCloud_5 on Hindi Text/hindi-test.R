#install.packages("tibble")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("tm")
#install.packages("UTF-8")

## Import Libraries
library(tibble)
library(dplyr)
library(ggplot2)
library(tm)
library(utf8)
library(udpipe)



## Getting Work Directory
cname <- file.path("C:", "texts")
cname


##Check if the directory contains the file
dir(cname)


##Read data using UCS-2LE encoding
h <- readLines(con <- file("hindihealth.txt", encoding = "UCS-2LE"))
close(con)
unique(Encoding(h))

##Udpipe provides language agnostic "tokenization" and "parts of
##speech tagging", of raw text in many languages, including Chinese
##and Hindi
udmodel <- udpipe_download_model(language = "hindi")
udmodel <- udpipe_load_model(file = "hindi-hdtb-ud-2.4-190531.udpipe")

##udpipe_annotate() takes the language model and annoates the given text data
x <- udpipe_annotate(udmodel, h)
x <- data.frame(x)

##Checking the tokenized results
x$token
#Checking the Parts of Speech of the tokens
x$upos


##Plotting Part-of-speech tags from the given text, use package lattice
library(lattice)
stats <- txt_freq(x$upos)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = stats, col = "yellow", 
         main = "UPOS (Universal Parts of Speech)\n frequency of occurrence", 
         xlab = "Freq")


#Tallying the most common NOUNS from the annotated texts
stats <- subset(x, upos %in% c("NOUN"))
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "cadetblue", 
         main = "Most occurring nouns", xlab = "Freq")


#Tallying the most common ADJ from the annotated texts
stats <- subset(x, upos %in% c("ADJ")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "purple", 
         main = "Most occurring adjectives", xlab = "Freq")


#Tallying the most common VERB from the annotated texts
stats <- subset(x, upos %in% c("VERB")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "gold", 
         main = "Most occurring Verbs", xlab = "Freq")


######WORDCLOUD#######
x$token
x$upos

##Subsetting the Parts-of-Speech for analysis NOUN, VERB, ADJ.
##Excluded the Pronouns, Auxilieries,Conjunctions
 stats <- subset(x, upos %in% c("NOUN","VERB","ADJ"))
 stats <- txt_freq(stats$token)
 stats$key <- factor(stats$key, levels = rev(stats$key))
 barchart(key ~ freq, data = head(stats, 20), col = "cadetblue",
          main = "Most occurring tokens", xlab = "Freq")

 
 
 ################################
 ## WORDCLOUD
 ################################
 
 ## We are considering min freq to be 50 as words below that frequency does not hold 
 ## high significance and words with maximum frequency above 1000 are common nouns, verbs 
 ## which are insignificant in the analysis
 
library(wordcloud)
wordcloud(words = stats$key, freq = stats$freq, min.freq = 50, max.freq = 1000, max.words = 100,
          random.order = FALSE, colors = brewer.pal(6, "Dark2"), scale=c(1,0.5))

 