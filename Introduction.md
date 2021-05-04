---

title: "Grading Translations with Text Analytics"
author: "Steven Swenson"
date: "2/2/2021"
output: html_document

---

## Introduction

Basic Text analytics, also known as text mining, can be used to glean information or data from unstructured sources such as books or prose.  Initially, after watching a video on YouTube (Moffit 2020) talking about Introduction of color into literature has a specific order I wondered whether we could use text analytics to determine approximately when in a civilization a work was created.  Expanding on that perhaps we could  identify a specfic period or decade that a work was created based on it's thumbprint derived from analyzing its text as data.   

Immediately, a problem was encountered. Performing the initial analysis showed that translators had not been faithful to the original text!  So, I decided to  see if we can measure a translation's reliability.  I would construct a word frequency analysis and propose a rule of measure.  The words used would be common adjectives such as colors, sizes, distances. The measure would be the frequency each word appears/total words and the grade of a particular work might be the weighted average of all of these. 

    

## Packages Required

- tidyverse  provides access to dplyr and tidy data 

- tidytext provides tidy textmining interface and tokenizer 

- hunspell provides dictionary and stemming functions

- gutenbergr provides access to the online guntenberg project and works online

- jsonlite provides web service access

## Data Preparation

First we must prepare the system itself for the two ancient languages we will be using.  To do this I will be installing a library  reference for hunspell to use and store that in my Data Folder.

Latin Library 

Ancient Greek  Library 

The English library is already part of the standard library loaded into the system.  

Incidently thes libraries are the same as required to perform spell checking in a particular natural language and can be used system wide.  



Next the raw source texts need to be retrieved.

Tidytext performs some cleanup for us , such as converting case to all lower case and removing punctuation when we tokenize the work by word. 

Using the tokenizer we can generate a word histogram and then filter it for the adjectives in which we are interested.  For the English works we can also perform a more general word frequency rable and remove so called 'stop words'  or words that have little or no context ( e.g. The, a ,an, he, she, and ) using the built in stop_words dataframe from tidytext.

For the ancient languages we will need to perform 'stemming' using the hunspell library functions and library we loaded prior to or in adjunct with our word frequency analysis.  What this means is we will take a word in the language and  find it in all its forms.   We run into a problem almost right away.   When tested it was discovered that we will sometimes get ambiguous results as teh hunspell library may return more than one candidate for a stem.  To deal with this we will diagram and construct a concordanance of stems for our chosen set of adjectives.  Our thought is that the distortion of signal would be greater by dropping  than including ambiguous returns. Since we are only looking for specific words we should be effective at filtering extreneous words via concordanance.   Using an online generator (Krüger 2021) we constructed a concordanance for each word we will use in our metric. 







 This is necessary since both Latin and Ancient Greek are inflected languages, that is the word ending changes with the grammar concepts of number, gender, and case (part of speech: Subject/Nominative, object: dative etc. ) The Latin word for 'flat black' , for instance, is typically cited as "ater,atrum, atra" designating the nominative case for the three genders of Latin (masculine, neuter, and feminine) , combined this single word has 90 different forms (Foster 2018) in which it can appear.  We need the stemming function to allow us to create a word frequency count that relates back to 'black' in English so that our grading number can be useful. 

Each work's resulting word frequency analysis is then collected together.



## Exploratory Data Analysis

## Summary

I would use as controls original works Aenid, Odyssey, Illiad, and an English 1st edition publication

I would then grade three translations for each of these scored against various translations or in the case of the English work multiple editions. I would expect that we may see divergence in our grade among translations but a smaller divergence between various editions of the same book.









Sources

Moffit, Mitchell. "Why The Ancient Greeks Couldn't See Blue." Youtube, uploaded by AsapSCIENCE. 20 Nov 2020, https://www.youtube.com/watch?v=D1-WuBbVe2E,



Foster, Timothy. "The Latin Dictionary." latindictionary.wikidot.com,Feb 13, 2018, http://latindictionary.wikidot.com/adjective:ater.



Murzintcev, Nikita Ph.D. "Karl Zeller's  variant hunspell Dictionary." Latin-dict.github.io, Nov 11, 2020, https://latin-dict.github.io/docs/hunspell.html#:~:text=Hunspell%20is%20a%20spell%20checking,cur%C3%A2%E2%80%9D%20or%20%E2%80%9Cmal%C3%A8%E2%80%9D

.

[GitHub - mrakia/hunspell-ancient-greek: The Ancient Greek dictionary for Hunspell (grc_GR for Notepad++, Google Chrome, Vivaldi etc).](https://github.com/mrakia/hunspell-ancient-greek)



Castagnetto, JM. "Stemming with SnowballC vs hunspell." GitHub, Feb 12, 2020, (https://gist.github.com/jmcastagnetto/3b0776f7558621e5d06a2a0981b20c2e)



Krüger, Bernd. "Latin Declension Tables" Cactus2000, 2021, [gener&#257;tor: Latin nouns, Cactus2000](https://latin.cactus2000.de/noun/shownoun_en.php?n=generator)


