*********************************************
5 wordcloud on abc news
	5-nlp.R exercise file for analysis and wordcloud
	screenshots of output
	wordcloud
	Text Mining
	abcnews-date-text dataset
********************************************
********************************************
Hindi Text Analysis(5)
	hindi-test.r contains the code for text analysis on the hindihealth.txt dataset
	hindihealth.txt the dataset used for text analysis
	output of the text analysis
	WORDCLOUD
	Text Mining
	##Subsetting the Parts-of-Speech for analysis NOUN, VERB, ADJ.
	##Excluded the Pronouns, Auxilieries,Conjunctions
********************************************
********************************************
NLP on English Text
	4-textmining-cloud.R exercise file for analysis and wordcloud
	iliad and odyssey the dataset on which analysis is performed
	sceenshots of output
	WORDCLOUD
	Advanced Natural Language Processing(NLP) using udpipe package
********************************************
Performed basic Text Mining using tm package
1)Preprocessing
	Removing punctuation:Punctuation and other special characters only look like more words to your computer and R
	Removing numbers
	Converting to lowercase: We want a word to appear exactly the same every time it appears
	Removing "stopwords" (common words) that usually have no analytic value.
	Removing particular words which are not of value to your particular analysis
	Removing common word endings (e.g., "ing", "es", "s")
	Stripping unnecesary whitespace from your documents

2)Staging the Data
	Create a document term matrix

3)Explore your data
	Organize terms by their frequency
	Considering only the 20 greatest frequencies
	We can see that there is a huge disparity in how frequently some terms appear
	Plot Word Frequencies

4)Statistics
	Relationships Between Terms
	Term Correlations
	